import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CrumbButton extends StatelessWidget {
  final Function? onTap;
  final double? width;
  final Widget? icon, activeIcon;
  final String? text;
  final bool? active;
  final Color? color, activeColor, textColor, activeTextColor, lineColor, activeLineColor;
  const CrumbButton({
    Key? key, 
    this.onTap, 
    this.width, 
    this.icon, 
    this.activeIcon,
    this.text = '', 
    this.active = true,
    this.color = Colors.white,
    this.activeColor = Styles.colorEAF9FF,
    this.textColor = Styles.color6A6A6A,
    this.activeTextColor = Styles.color0A58B4,
    this.lineColor = Styles.colorD1D2D4,
    this.activeLineColor = Styles.color0A58B4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: BaseContainer(
        width: width ?? 110.0.w,
        height: 34.0.w,
        padding: EdgeInsets.symmetric(horizontal: 4.0.w),
        radius: BorderRadius.circular(8.0.w),
        color: active! ? activeColor : color,
        border: Border.all(
          color: active! ? activeLineColor! : lineColor!, 
          width: 1.0.w
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            active! ? activeIcon! : icon!,
            Caption1Text(
              text,
              color: active! ? activeTextColor : textColor,
            )
          ],
        ),
      ),
    );
  }
}
