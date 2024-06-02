import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LocationMark extends StatelessWidget {
  final String? label;
  const LocationMark({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarkLabel(
      icon: mapPin,
      label: label ?? '',
    );
  }
}
