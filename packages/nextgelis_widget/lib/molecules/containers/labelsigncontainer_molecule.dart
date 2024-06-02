import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LabelSignContainer extends StatelessWidget {
  final String? text;
  final SignStyle? style;
  final Color? color;

  const LabelSignContainer({Key? key, this.text = '', this.style = SignStyle.line, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      radius: BorderRadius.circular(10.0.w),
      color: style == SignStyle.line ? null : color,
      border: style == SignStyle.line ? Border.all(
        color: color!,
        width: 1.w
      ) : null,
      height: 22.0.w,
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Caption3Text(
        text,
        color: style == SignStyle.line ? color : Colors.white
      ),
    );
  }
}
