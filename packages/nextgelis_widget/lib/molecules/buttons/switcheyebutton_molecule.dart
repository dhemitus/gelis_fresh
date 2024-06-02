import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SwitchEyeButton extends StatelessWidget {
  final Function(bool)? onTap;
  final bool? hide;

  const SwitchEyeButton({Key? key, this.onTap, this.hide = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!.call(!hide!) ?? {},
      child: BaseContainer(
        width: 24.0.w,
        height: 24.0.w,
        child: hide! ? eye : eyeOff,
      ),
    );
  }
}
