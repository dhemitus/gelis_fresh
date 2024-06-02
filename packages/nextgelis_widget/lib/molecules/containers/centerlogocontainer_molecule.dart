import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CenterLogoContainer extends StatelessWidget {
  const CenterLogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
        width: 1.sw,
        height: 1.sw,
        image: ImageUtilities.imageAsset('packages/nextgelis_widget/assets/images/centerlogo.png', fit: BoxFit.contain)
    );
  }
}
