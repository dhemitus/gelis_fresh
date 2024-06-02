import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProcessForm extends StatelessWidget {
  final Widget? process, button;
  const ProcessForm({Key? key, this.process, this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: process,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 68.0.w, vertical: 16.0.w),
            child: button
          ),
        ]
      ),
    );
  }
}
