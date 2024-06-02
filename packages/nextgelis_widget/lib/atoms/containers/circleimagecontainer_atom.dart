import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CircleImageContainer extends StatelessWidget {
  final String? icon;
  final DecorationImage? image;
  final ButtonHeight? size;

  const CircleImageContainer({Key? key, this.icon, this.image, this.size = ButtonHeight.small}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      image: image,
      width: size == ButtonHeight.small ? 62.0.w : 128.0.w,
      height: size == ButtonHeight.small ? 62.0.w : 128.0.w,
      radius: BorderRadius.circular(size == ButtonHeight.small ? 62.0.w : 128.0.w),
    );
  }
}
