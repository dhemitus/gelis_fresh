import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class FieldForm extends StatelessWidget {
  final Widget? ntu, button;
  final String? label;
  final List<Widget>? inputs;
  const FieldForm({Key? key, this.ntu, this.button, this.label, this.inputs}) : super(key: key);

  List<Widget> list() {
    List<Widget> l = [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
        child: LabelHeader(label: label)
      ),
    ];

    if(inputs != null && inputs!.isNotEmpty){
      inputs!.map((e) => l.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
          child: e,
        )
      )).toList();
    }

    l.add(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 68.0.w, vertical: 16.0.w),
        child: button
      )
    );
    return l;
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: list()
      ),
    );
  }
}
