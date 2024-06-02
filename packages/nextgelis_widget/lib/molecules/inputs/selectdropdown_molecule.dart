import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SelectDropDown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final double? width;
  final T? value;
  final Function(T?)? onChange;
  const SelectDropDown({Key? key, this.items, this.width, this.value, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: 48.0.w, 
      //width: width ?? 136.0.w,
      child: InputDecorator(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0.w)),
            borderSide: BorderSide(color: Styles.colorBABEC2, width: 1.0.w),
          ),
          contentPadding: EdgeInsets.all(10.0.w)
        ), 
        child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isDense: true,
          isExpanded: true,
          items: items,
          value: value,
          onChanged: onChange,
        )
      ),),
    );
  }
}
