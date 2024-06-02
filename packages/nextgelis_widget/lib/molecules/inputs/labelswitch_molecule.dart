import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LabelSwitch extends StatelessWidget {
  final String? label;
  final bool? value;
  final Function(bool)? onChange;

  const LabelSwitch({Key? key, this.label, this.value, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Title1Text(label),
        SizedBox(width: 12.0.w,),
        Switch(
          value: value!,
          activeColor: Styles.color0A58B4,
          onChanged: (b) => onChange!.call(b),
          //side: BorderSide(width: 1.0.w, color: Styles.colorC0C0C0),
        ),
      ],
    );
  }
}
