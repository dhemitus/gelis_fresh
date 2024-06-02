import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LineLabel extends StatelessWidget {
  final String? label;
  final Widget? icon, suffix;
  const LineLabel({Key? key, this.label, this.icon, this.suffix}) : super(key: key);

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
        Expanded(child: Body2Text(label, overflow: TextOverflow.ellipsis, color: Styles.color3B4958)),
        suffix ?? Container()
      ],
    );
  }
}
