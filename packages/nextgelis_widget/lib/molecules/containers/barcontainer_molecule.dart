import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class BarContainer extends StatelessWidget {
  final String? label;
  final BarColor? color;

  const BarContainer({Key? key, this.label, this.color = BarColor.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      alignment: Alignment.centerLeft,
      radius: BorderRadius.circular(6.0.w),
      margin: EdgeInsets.only(top: 4.0.w, bottom: 4.0.w, right: 16.0.w),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      color: switch(color){
        BarColor.blue => Styles.color209FE7,
        BarColor.yellow => Styles.colorFFB703,
        BarColor.orange => Styles.colorFB8500,
        _ => Styles.color209FE7
      } /*Styles.color209FE7 */,
      height: 26.0.w,
      child: Title1Text(label ?? '', color: Colors.white,)
    );
  }
}
