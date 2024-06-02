import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ContactLabel extends StatelessWidget {
  final String? label;
  const ContactLabel({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineLabel(
      icon: contact,
      label: label ?? '',
    );
  }
}
