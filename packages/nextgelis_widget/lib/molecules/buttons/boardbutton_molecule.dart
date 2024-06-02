import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class BoardButton extends StatelessWidget {
  final Function? onTap;
  final String? text;
  final Widget? icon;

  const BoardButton({Key? key, this.onTap, this.text = '', this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!.call(),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          icon ?? Container(),
          Caption3Text(text, color: Styles.color5C5C5C,)
        ]
      ),
    );
  }
}
