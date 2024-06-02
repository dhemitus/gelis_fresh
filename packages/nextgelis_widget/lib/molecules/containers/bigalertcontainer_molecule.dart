import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class BigAlertContainer extends StatelessWidget {
  final String? label;

  const BigAlertContainer({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: EdgeInsets.all(16.0.w),
      color: Styles.colorD1D2D4,
      radius: BorderRadius.circular(10.0.w),
      child: Row(
        children: <Widget>[
          alertCircleError,
          SizedBox(width: 10.0.w,),
          Expanded(
            child: Caption1Text(label ?? '', color: Styles.color102235,)
          )
        ]
      ),
    );
  }
}
