import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class MarkSignContainer extends StatelessWidget {
  final String? text;
  final Color? color, labelColor;

  const MarkSignContainer({Key? key, this.text = '', this.color, this.labelColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      radius: BorderRadius.circular(6.0.w),
      color: color,
      height: 22.0.w,
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Caption3Text(
        text,
        color: labelColor
      ),
    );
  }
}
