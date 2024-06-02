import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LocationLabel extends StatelessWidget {
  final String? label;
  const LocationLabel({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineLabel(
      icon: mapPin,
      label: label ?? '',
    );
  }
}
