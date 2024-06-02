import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LoginForm extends StatelessWidget {
  final Widget? username, password, button, error;
  const LoginForm({Key? key, this.username, this.password, this.button, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0.w, vertical: 24.0.w),
          child: error ?? BaseContainer(height: 34.0.w,)
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0.w),
          child: username,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0.w, vertical: 16.0.w),
          child: password,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0.w, vertical: 16.0.w),
          child: button
        )
      ]
    );
  }
}
