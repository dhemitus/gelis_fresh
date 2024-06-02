import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class PrimaryButton extends StatelessWidget {
  final Function? onTap;
  final String? text;
  final bool? enable;
  final ButtonHeight? height;
  final Color? color, disabledColor, textColor, disabledTextColor;

  const PrimaryButton({
    Key? key, 
    this.onTap, 
    this.text = '', 
    this.enable = true,
    this.height = ButtonHeight.big,
    this.color = Styles.color145DB4,
    this.disabledColor = Styles.colorC5C5C5,
    this.textColor = Colors.white,
    this.disabledTextColor = Colors.white
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => enable! ? onTap?.call() : {},
      child: BaseContainer(
        padding: height == ButtonHeight.small ? EdgeInsets.symmetric(horizontal: 10.0.w) : null,
        radius: BorderRadius.circular(8.0.w),
        height: height == ButtonHeight.big ? 56.0.w : height == ButtonHeight.small ? 38.0.w : 34.0.w,
        color: enable!
            ? color
            : disabledColor,
        child:height == ButtonHeight.small || height == ButtonHeight.smaller ?
        Caption3Text(
          text ?? '',
          color: enable!
              ? textColor
              : disabledTextColor,

        )
        :
        Title1Text(
          text ?? '',
          color: enable!
              ? textColor
              : disabledTextColor,
        )
      ),
    );
  }
}
