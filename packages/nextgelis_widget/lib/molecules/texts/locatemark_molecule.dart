import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LocateMark extends StatelessWidget {
  final String? label;
  const LocateMark({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarkLabel(
      icon: locate,
      label: label ?? '',
    );
  }
}
