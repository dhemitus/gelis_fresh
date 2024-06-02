import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class NowDateContainer extends StatelessWidget {
  final String text;
  const NowDateContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateContainer(text: text,);
  }
}
