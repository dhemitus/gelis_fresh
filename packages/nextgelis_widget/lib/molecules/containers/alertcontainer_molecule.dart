import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class AlertContainer extends StatelessWidget {
  final String? label;

  const AlertContainer({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      color: Styles.colorF8D7D7,
      height: 34.0.w,
      child: Row(
        children: <Widget>[
          alertCircleError,
          SizedBox(width: 10.0.w,),
          Title1Text(label ?? '', color: Styles.colorD30000,)
        ]
      ),
    );
  }
}
