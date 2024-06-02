import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LabelSelectDropDown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final double? width;
  final T? value;
  final Function(T?)? onChange;
  final String? label;
  final Widget? widget;
 
  const LabelSelectDropDown({Key? key, this.items, this.width, this.value, this.onChange, this.label, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelHeader(label: label, widget: widget,),
        SizedBox(height: 8.0.w,),
        SelectDropDown<T>(
          value: value,
          onChange: onChange,
          items: items,
        )
      ],
    );
  }
}
