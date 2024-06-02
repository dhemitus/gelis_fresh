import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class OnGoingScreen extends StatelessWidget {
  final PagingController<int, WoModel> _pagingController = PagingController(firstPageKey: 0); 
  OnGoingScreen({Key? key}) : super(key: OnGoingRoute.key);
//final log = Logger();

  @override
  Widget build(BuildContext context) {

    void onsearch() {
      _pagingController.refresh();
      context.read<OnGoingListBloc>().add(GetOnGoingListEvent());
    }

    void back() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    return OnGoingPage(
      head: TitleHeader(
        label: 'Ongoing', 
        onSearch: onsearch,
        onChange: (String s) => context.read<OnGoingListBloc>().add(GetOnGoingSearchEvent(s)),
        back: true,
        onBack: back,
      ),
      child: OnGoingList(pagingController: _pagingController,),
    );
  }
}
