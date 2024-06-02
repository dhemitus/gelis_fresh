import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class DataScreen extends StatelessWidget {
  final PagingController<int, WoModel> _pagingController = PagingController(firstPageKey: 0); 
  DataScreen({Key? key}) : super(key: DataRoute.key);

  @override
  Widget build(BuildContext context) {

    void onsearch() {
      _pagingController.refresh();
      context.read<DataListBloc>().add(GetDataListEvent());
    }
    return DataPage(

      head: TitleHeader(
        label: 'Data', 
        onSearch: onsearch,
        onChange: (String s) => context.read<DataListBloc>().add(GetDataSearchEvent(s)),
        back: false,
      ),
      child: DataList(pagingController: _pagingController,),
    );
  }
}
