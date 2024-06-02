import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class PowerContainer extends StatelessWidget {
  const PowerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
        width: 122.0.w,
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 16.w),
                  child: const Caption1Text("Powered by")
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.w),
                  child: yucore,
                )
              ],
            ),
    );
  }
}
