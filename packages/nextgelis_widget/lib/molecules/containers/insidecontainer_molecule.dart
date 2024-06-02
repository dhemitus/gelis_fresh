import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class InsideContainer extends StatelessWidget {
  const InsideContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      width: 1.sw,
      height: 1.sh,
      image: ImageUtilities.imageAsset('packages/nextgelis_widget/assets/images/bghome.jpg')
    );
  }
}
