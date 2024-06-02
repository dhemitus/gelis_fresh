import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class HistoryScreen extends StatelessWidget {
  final PagingController<int, WoModel> _pagingController = PagingController(firstPageKey: 0); 
  HistoryScreen({Key? key}) : super(key: HistoryRoute.key);
//final log = Logger();

  @override
  Widget build(BuildContext context) {

    void onsearch() {
      _pagingController.refresh();
      context.read<HistoryListBloc>().add(GetHistoryListEvent());
    }

    return HistoryPage(
      head: FilterHeader(
        label: 'Riwayat', 
        onSearch: onsearch,
        onChange: (String s) => context.read<HistoryListBloc>().add(GetHistorySearchEvent(s)),
        back: false,
      ),
      child: HistoryList(pagingController: _pagingController,),
    );
  }
}
