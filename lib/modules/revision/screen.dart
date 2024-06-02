import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class RevisionScreen extends StatelessWidget {
  final PagingController<int, WoModel> _pagingController = PagingController(firstPageKey: 0); 
  RevisionScreen({Key? key}) : super(key: ReportRoute.key);
//final log = Logger();

  @override
  Widget build(BuildContext context) {

    void onsearch() {
      _pagingController.refresh();
      context.read<RevisionListBloc>().add(GetRevisionListEvent());
    }

    void back() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    return RevisionPage(
      head: TitleHeader(
        label: 'Permintaan Revisi', 
        onSearch: onsearch,
        onChange: (String s) => context.read<RevisionListBloc>().add(GetRevisionSearchEvent(s)),
        back: true,
        onBack: back,
      ),
      child: RevisionList(pagingController: _pagingController,),
    );
  }
}
