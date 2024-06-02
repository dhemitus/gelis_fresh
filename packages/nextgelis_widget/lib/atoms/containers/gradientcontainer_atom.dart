import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    Key? key,
    this.child,
    this.width = 1,
    this.height = 1
  }) : super(key : key);

  final Widget? child;
  final double width, height;

  @override
  Widget build(BuildContext context) {

    return BaseContainer(
      height: height,
      width: width,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Styles.color0025CE.withOpacity(0.0),
          Styles.color145DB4
        ]
      ),
      child: child,
    );
  }
}
