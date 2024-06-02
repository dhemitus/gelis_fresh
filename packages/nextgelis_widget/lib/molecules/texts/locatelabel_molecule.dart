import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LocateLabel extends StatelessWidget {
  final String? label;
  final Widget? suffix;
  const LocateLabel({Key? key, this.label, this.suffix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineLabel(
      icon: locate,
      label: label ?? '',
      suffix: suffix,
    );
  }
}
