import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final BorderRadius? radius;
  final Border? border;
  final double? width, height;
  final EdgeInsets? padding, margin;
  final Alignment? alignment;
  final List<BoxShadow>? shadow;
  final LinearGradient? gradient;
  final DecorationImage? image;
  final BoxShape? shape;

  const BaseContainer(
    {Key? key,
      this.alignment = Alignment.center,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.color,
      this.image,
      this.gradient,
      this.radius,
      this.shadow,
      this.border,
      this.shape}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width ,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        image: image,
        gradient: gradient,
        border: border,
        color: color,
        shape: shape != null ? shape! : BoxShape.rectangle,
        borderRadius: radius,
        boxShadow: shadow
      ),
      child: child,
    );
  }
}
