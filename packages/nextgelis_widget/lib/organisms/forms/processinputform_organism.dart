import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ProcessInputForm extends StatelessWidget {
  final Widget? result, done, note, member, button;
  final String? label;

  const ProcessInputForm({Key? key, this.result, this.done, this.member, this.note, this.button, this.label}) : super(key: key);

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
            child: done ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
            child: result ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
            child: member ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
            child: note ?? Container(),
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
