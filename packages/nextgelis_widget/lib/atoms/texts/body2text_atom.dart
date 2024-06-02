import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class Body2Text extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Color? color;
  final TextAlign? align;
  final TextOverflow? overflow;

  const Body2Text(this.text, {Key? key, this.style, this.color, this.align, this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
    text ?? '',
    style: style?.copyWith(
        fontSize: 16.0.sp,
        fontStyle: FontStyle.normal,
        letterSpacing: 0.2.sp,
        color: color ?? Styles.color6A6A6A
    ) ?? Styles.text14W600.copyWith(
        color: color ?? Styles.color6A6A6A
    ),
    textAlign: align,
    overflow: overflow,
  );
}
