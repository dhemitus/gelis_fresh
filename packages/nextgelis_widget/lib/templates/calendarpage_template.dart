import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CalendarPage extends StatelessWidget {
  final Widget? child, head;
  final String? label;
  const CalendarPage({Key? key, this.child, this.head, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 48.0.w,
          ),
          SizedBox(
            height: 412.0.w,
            child: head ?? Container(),
          ),
          Expanded(
            child: BaseContainer(
              padding: EdgeInsets.only(top: 12.0.w),
              width: 1.sw, 
              height: double.infinity, 
              color: Styles.colorEAF9FF,
              child: child ??  Container(),
            ),
          ),
          const CalendarLegend()
        ],
      ),
    );
  }
}
