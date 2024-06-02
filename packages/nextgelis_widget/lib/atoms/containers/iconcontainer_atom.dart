import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    Key? key,
    this.child,
  }) : super(key : key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      width: 24.0.w,
      height: 24.0.w,
      child: child,
    );
  }
}
