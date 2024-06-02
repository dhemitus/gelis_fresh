import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LoginButton extends StatelessWidget {
  final Function? onTap;
  final String? text;
  final bool? enable;

  const LoginButton({Key? key, this.onTap, this.text = '', this.enable = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => enable! ? onTap!.call() : {},
      child:  BaseContainer(
          child: BaseContainer(
            radius: BorderRadius.circular(8.0.w),
            height: 56.0.w,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Styles.color0025CE,
                Styles.color00EAFF
              ]
            ),
              child: Title1Text(
                text ?? '',
                color: enable!
                    ? Colors.white
                    : Colors.white,
              )
          ),
        ),
      );
  }
}
