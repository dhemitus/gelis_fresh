import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ReportScreen extends StatelessWidget {
  final PagingController<int, WoModel> _pagingController = PagingController(firstPageKey: 0); 
  ReportScreen({Key? key}) : super(key: ReportRoute.key);
//final log = Logger();

  @override
  Widget build(BuildContext context) {

  void onsearch() {
    _pagingController.refresh();
    context.read<ReportListBloc>().add(GetReportListEvent());
  }

    void back() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    return ReportPage(
      head: TitleHeader(
        label: 'Berita Acara', 
        onSearch: onsearch,
        onChange: (String s) => context.read<ReportListBloc>().add(GetReportSearchEvent(s)),
        back: true,
        onBack: back,
      ),
      child: ReportList(pagingController: _pagingController,),
    );
  }
}
