import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LegendContainer extends StatelessWidget {
  final String? label;
  final BarColor? color;

  const LegendContainer({Key? key, this.label, this.color = BarColor.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      BaseContainer(
        radius: BorderRadius.circular(4.0.w),
        margin: EdgeInsets.only(right: 8.0.w),
        color: switch(color){
          BarColor.blue => Styles.color209FE7,
          BarColor.yellow => Styles.colorFFB703,
          BarColor.orange => Styles.colorFB8500,
          _ => Styles.color209FE7
        } /*Styles.color209FE7 */,
        height: 16.0.w,
        width: 16.0.w,
      ),
      Caption1Text(label)
    ],);
  }
}
