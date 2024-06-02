import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CalendarLegend extends StatelessWidget {
  const CalendarLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: 36.0.w,
      padding: EdgeInsets.only(left: 32.0.w, right: 16.0.w),
      color: Styles.colorEAF9FF,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LegendContainer(color: BarColor.orange, label: 'Approve Order',),
          LegendContainer(color: BarColor.yellow, label: 'Checklist OK',),
          LegendContainer(color: BarColor.blue, label: 'Ongoing',)
        ]
      ),
    );
  }
} 
