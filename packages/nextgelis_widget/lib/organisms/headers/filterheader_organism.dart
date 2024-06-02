import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class FilterHeader extends StatelessWidget {
  final String? label;
  final Function(String)? onChange;
  final Function()? onSearch;
  final bool? back;
  const FilterHeader({
    Key? key,
    this.label,
    this.onChange,
    this.onSearch,
    this.back = true
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 60.0.w, left: 20.0.w, right: 20.0.w), 
        child: Column(
          children: [
            SearchInputText(onSearch: onSearch, onChange: onChange,),
            SizedBox(height: 10.0.w,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FilterDropDown<String>(
                  width: 136.0,
                  items: [
                    DropdownMenuItem(value: 'Semua Status', child: Caption1Text('Semua Status')),
                    DropdownMenuItem(value: 'Berhasil', child: Caption1Text('Berhasil')),
                    DropdownMenuItem(value: 'Dibatalkan', child: Caption1Text('Dibatalkan')),
                  ], 
                  onChange: null,
                  value: 'Semua Status',
                ),
                SizedBox(width: 8.0.w,),
                FilterDropDown<String>(
                  width: 142.0.w,
                  items: ['Jenis Sampling', 'Air Limbah', 'Udara Ambient'].map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                      value: e,
                      child: Center(child: Caption1Text(e)),
                    )
                  ).toList(),
                  onChange: null,
                  value: 'Jenis Sampling',
                ),
                SizedBox(width: 8.0.w,),
                FilterDropDown<String>(
                  width: 146.0.w,
                  items: ['Semua Tanggal', 'Kemarin', 'Hari Ini'].map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                      value: e,
                      child: Caption1Text(e),
                    )
                  ).toList(),
                  onChange: null,
                  value: 'Semua Tanggal',
                ),               
              ],
            ),
            ),
          ]
        ),
      );
  }
}
