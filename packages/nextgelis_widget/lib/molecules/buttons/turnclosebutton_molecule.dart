import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class TurnCloseButton extends StatelessWidget {
  final Function? onTap;
  const TurnCloseButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: BaseContainer(
        width: 24.0.w,
        height: 24.0.w,
        child: x,
      ),
    );
  }
}
