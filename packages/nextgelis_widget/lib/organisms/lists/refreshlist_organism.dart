import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RefreshList<T> extends StatelessWidget {
  final Function? onRefresh;
  final Function(BuildContext context, int index) builder;
  final List<T> items;
  final bool? space;
  const RefreshList({Key? key, required this.items, this.onRefresh, required this.builder, this.space = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => onRefresh!.call() ?? {},
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: space! ? 150.0.w : 30.0.w, top: 8.0.w),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => builder.call(context, index),
      ),
    );
  }
}
