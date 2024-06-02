import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class BottomContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  const BottomContainer({Key? key, this.child, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      color: Colors.white,
      radius: BorderRadius.only(topLeft: Radius.circular(16.0.w), topRight: Radius.circular(16.0.w)),
      height: height,
      child: child,
    );
  }
}
