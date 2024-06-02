import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ApprovePage extends StatelessWidget {
  final Widget? child, head;
  final String? label;
  const ApprovePage({Key? key, this.child, this.head, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 164.0.w,
            child: head ?? Container(),
          ),
          Expanded(
            child: child ?? BaseContainer(width: 1.sw, height: double.infinity,),
          ),
        ],
      ),
    );
  }
}
