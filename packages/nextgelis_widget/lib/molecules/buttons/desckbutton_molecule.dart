import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class DescButton extends StatelessWidget {
  final Function? onTap;
  const DescButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: BaseContainer(
        width: 20.0.w,
        height: 22.0.w,
        child: threeDot,
      ),
    );
  }
}
