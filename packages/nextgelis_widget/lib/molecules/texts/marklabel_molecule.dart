import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class MarkLabel extends StatelessWidget {
  final String? label;
  final Widget? icon;
  const MarkLabel({Key? key, this.label, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseContainer(
          height: 14.0.w,
          width: 14.0.w,
          margin: EdgeInsets.only(right: 4.0.w),
          child: icon ?? Container(),
        ),
        Body2Text(label, overflow: TextOverflow.ellipsis, color: Styles.color3B4958),
      ],
    );
  }
}
