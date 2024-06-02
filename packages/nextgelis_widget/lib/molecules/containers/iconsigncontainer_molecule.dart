import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class IconSignContainer extends StatelessWidget {
  final Widget? icon;
  final SignStyle? style;
  final Color? color;

  const IconSignContainer({Key? key, this.icon, this.style = SignStyle.line, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      radius: BorderRadius.circular(6.0.w),
      color: style == SignStyle.line ? null : color,
      border: style == SignStyle.line ? Border.all(
        color: color!,
        width: 1.w
      ) : null,
      width: 22.0.w,
      height: 20.0.w,
      child: icon,
    );
  }
}
