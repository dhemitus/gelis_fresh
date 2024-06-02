import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SecondaryButton extends StatelessWidget {
  final Function? onTap;
  final String? text;
  final bool? enable;
  final ButtonHeight? height;
  final Color? color, disabledColor, textColor, disabledTextColor;
  final SignStyle? style;

  const SecondaryButton({
    Key? key, 
    this.onTap, 
    this.text = '', 
    this.enable = true,
    this.height = ButtonHeight.big,
    this.color = Styles.color145DB4,
    this.disabledColor = Styles.colorC5C5C5,
    this.textColor = Colors.white,
    this.disabledTextColor = Colors.white,
    this.style = SignStyle.line
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => enable! ? onTap?.call() : {},
      child: BaseContainer(
        padding: height == ButtonHeight.small ? EdgeInsets.symmetric(horizontal: 10.0.w) : null,
        radius: BorderRadius.circular(8.0.w),
        border: style == SignStyle.line ? Border.all(
          color: enable!
            ? color!
            : disabledColor!, 
          width: 1.w
        ) : null,
        height: height == ButtonHeight.big ? 56.0.w : 38.0.w,
        color: style == SignStyle.line ? null : color,
        child:height == ButtonHeight.small ?
        Caption3Text(
          text ?? '',
          color: enable!
              ? textColor
              : disabledColor,

        )
        :
        Title1Text(
          text ?? '',
          color: enable!
              ? style == SignStyle.line ? textColor : Colors.white
              : disabledTextColor,
        )
      ),
    );
  }
}
