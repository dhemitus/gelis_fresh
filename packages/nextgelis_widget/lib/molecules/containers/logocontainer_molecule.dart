import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
        width: 260.0.w,
        height: 140.0.w,
        image: ImageUtilities.imageAsset('packages/nextgelis_widget/assets/images/logo.png')
    );
  }
}
