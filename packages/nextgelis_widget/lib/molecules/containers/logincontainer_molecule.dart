import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      alignment: Alignment.bottomCenter,
      width: 1.sw,
      height: 386.w,
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Styles.color0025CE,
          Styles.color4d91dc
        ]
      ),
      /*child: Padding(
        padding: EdgeInsets.only(top: .42.sh-95),
        child: cloud
      ),*/
    );
  }
}
