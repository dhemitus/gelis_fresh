import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class RevisedScreen extends StatelessWidget {
  final PagingController<int, WoModel> _pagingController = PagingController(firstPageKey: 0); 
  RevisedScreen({Key? key}) : super(key: ReportRoute.key);
//final log = Logger();

  @override
  Widget build(BuildContext context) {

    void onsearch() {
      _pagingController.refresh();
      context.read<RevisedListBloc>().add(GetRevisedListEvent());
    }

    void back() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    return RevisedPage(
      head: TitleHeader(
        label: 'Permintaan Revisi', 
        onSearch: onsearch,
        onChange: (String s) => context.read<RevisedListBloc>().add(GetRevisedSearchEvent(s)),
        back: true,
        onBack: back,
      ),
      child: RevisedList(pagingController: _pagingController,),
    );
  }
}
