import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SideBarContainer extends StatelessWidget {
  final double? height;
  final Color? color;
  const SideBarContainer({Key? key, this.color, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      radius: BorderRadius.only(topLeft: Radius.circular(16.0.w), bottomLeft: Radius.circular(16.0.w)),
      width: 6.w,
      height: double.infinity,
      color: color ?? Styles.color2FB8F7,
      border: Border.all(color: color ?? Styles.color2FB8F7, width: 1.0.w),
    );
  }
}
