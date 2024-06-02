import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class UnderlineLabel extends StatelessWidget {
  final String? label, text;
  const UnderlineLabel({Key? key, this.label, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelHeader(label: label,),
        SizedBox(height: 8.0.w,),
        BaseContainer(
          alignment: Alignment.centerLeft,
          border: Border(bottom: BorderSide(color: Styles.colorC0C0C0, width: 1.0.w)),
          padding: EdgeInsets.symmetric(horizontal: 4.0.w),
          child: Title2Text(text),
        )
      ],
    );
  }
}
