import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LabelHeader extends StatelessWidget {

  final String? label;
  final Widget? widget;
  const LabelHeader({Key? key, this.label, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Title2Text(label, color: Styles.color102235,),
        widget ?? Container()
      ],
    );
  }
}
