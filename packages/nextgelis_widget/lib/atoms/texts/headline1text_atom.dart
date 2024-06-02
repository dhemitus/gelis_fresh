import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class Headline1Text extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Color? color;
  final TextAlign? align;

  const Headline1Text(this.text, {Key? key, this.style, this.color, this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text ?? '',
    style: style?.copyWith(
        fontSize: 26.0.sp,
        fontStyle: FontStyle.normal,
        letterSpacing: -1.5.sp,
        color: color ?? Styles.color6A6A6A
    ) ?? Styles.text24W900.copyWith(
        color: color ?? Styles.color6A6A6A
    ),
    textAlign: align,
  );
}
