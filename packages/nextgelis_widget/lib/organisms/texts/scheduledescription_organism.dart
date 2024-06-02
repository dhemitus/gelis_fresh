import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ScheduleDescription extends StatelessWidget {
  final String? title, date;
  final List<Map>? wo; 
  final List<String>? schedule;

  const ScheduleDescription({
    Key? key,
    this.title,
    this.date,
    this.wo = const [],
    this.schedule = const []
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late DateTime d;

    if(date!.isNotEmpty) {
      d = DateTime.parse(date!);
    }

    List<Widget> l = [
      SizedBox(height: 28.0.w),
      Title2Text(title ?? ''),
    ];

    if(wo!.isNotEmpty){
      wo!.map((e) { 
        l.add(BarContainer(
          label: e['label'], color: switch(e['mark']){
            'approve' => BarColor.orange,
            'checklist' => BarColor.yellow,
            _ => BarColor.blue
          },));

        l.add(Caption2Text(TimeUtilities.toRangeString(e['start'], e['finish'])));
        }
      ).toList();
    }

    if(schedule!.isNotEmpty) {
      schedule!.map((e) => l.add(Caption2Text(e))).toList();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseContainer(
          width: 86.0.w,
          child: 
            Column(
              children: [
                Title1Text(DateFormat('EEE', 'id_ID').format(d)),
                Headline1Text(DateFormat('d').format(d))
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: l,
          )
        )
      ],
    );
  }
}
