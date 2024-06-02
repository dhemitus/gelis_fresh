import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ShadowCard extends StatelessWidget {
  final Widget? child;
  const ShadowCard({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
        margin: EdgeInsets.only(bottom: 16.0.w),
        color: Colors.white,
        radius: BorderRadius.circular(16.0.w),
        shadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 4.0.w),
              blurRadius: 6.0.w,
              spreadRadius: 4.0.w
          )
        ],
        child: child,
      );
  }
}
