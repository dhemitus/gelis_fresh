import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SuffixContainer extends StatelessWidget {
  final Widget? icon;

  const SuffixContainer({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      color: Styles.colorD8D8D8,
      radius: BorderRadius.only(
        topRight: Radius.circular(10.0.w),
        bottomRight:Radius.circular(10.0.w) 
      ),
      width: 24.0.w,
      //height: 24.0.w,
      child: icon ?? Container()
    );
  }
}
