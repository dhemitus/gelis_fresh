import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SupportInputForm extends StatelessWidget {
  final Widget? result, time, member, button;
  final String? label;

  const SupportInputForm({Key? key, this.result, this.time, this.member, this.button, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: LabelHeader(label: label)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
            child: result ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
            child: time ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
            child: member ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.0.w, vertical: 8.0.w),
            child: button ?? Container(),
          ),
        ],
      ),
    );
  }
}
