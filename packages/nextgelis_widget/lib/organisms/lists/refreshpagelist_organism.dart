import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RefreshPageList<T> extends StatelessWidget {
  final Function? onRefresh;
  final Function(BuildContext context, T item, int index) builder;
  final List<T> items;
  final bool? space;
  final PagingController<int, T> pagingController;
  const RefreshPageList({Key? key, required this.items, required this.pagingController, this.onRefresh, required this.builder, this.space = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh!.call() ?? {},
      child: PagedListView<int, T>(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: space! ? 150.0.w : 30.0.w, top: 8.0.w),
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (BuildContext context, T item, int index) => builder.call(context, item, index)
        ),
      ),
    );
  }
}
