import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class DateContainer extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? textColor;
  const DateContainer({Key? key, this.text, this.color = Styles.color3680C8, this.textColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      alignment: Alignment.center,
      margin: EdgeInsets.all(12.0.w),
      color: color,
      radius: BorderRadius.circular(4.0.w),
      child: Title2Text(text, color: textColor,),
    );
  }
}
