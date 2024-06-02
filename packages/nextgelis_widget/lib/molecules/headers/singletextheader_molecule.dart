import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SingleTextHeader extends StatelessWidget {
  final String? label;
  final VoidCallback? onClose;
  const SingleTextHeader({Key? key, this.label, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Body2Text(label ?? '', color: Styles.color3B4958),
        TurnCloseButton(onTap: onClose,)
      ],
    );
  }
}
