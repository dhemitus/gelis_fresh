import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CheckListScreen extends StatelessWidget {
  final PagingController<int, WoModel> _pagingController = PagingController(firstPageKey: 0); 
  CheckListScreen({Key? key}) : super(key: CheckRoute.key);
//final log = Logger();

  @override
  Widget build(BuildContext context) {

    void onsearch() {
      _pagingController.refresh();
      context.read<CheckListBloc>().add(GetCheckListEvent());
    }

    void back() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    return CheckListPage(
      head: TitleHeader(
        label: 'Checklist Ok', 
        onChange: (String s) => context.read<CheckListBloc>().add(GetCheckSearchEvent(s)),
        onSearch: onsearch,
        back: true,
        onBack: back,
      ),
      child: CheckList(pagingController: _pagingController,),
    );
  }
}
