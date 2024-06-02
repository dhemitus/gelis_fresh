import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class AvatarHeader extends StatelessWidget {
  final String? label, text;
  final Widget? widget;
  const AvatarHeader({Key? key, this.label, this.text, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget != null ? Padding(padding: EdgeInsets.only(right: 20.0.w), child: widget,) : Container(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Headline1Text(label, color: Colors.white,),
            SizedBox(height: 4.0.w,),
            Body2Text(text, color: Colors.white,)
          ],
        )
      ],
    );
  }
}
