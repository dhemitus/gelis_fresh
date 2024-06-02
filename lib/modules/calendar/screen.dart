import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: CalendarRoute.key);

  @override
  Widget build(BuildContext context) {

    void back() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    return CalendarPage(
      head: MonthTimeline(
        onBack: back,
        onSelect: (DateTime s) {
            context.read<CalendarBloc>().add(GetCalendarDateEvent(TimeUtilities.toSimpleString(s)));
            context.read<CalendarBloc>().add(GetCalendarListEvent());

          debugPrint('on select');
          debugPrint(s.toString());
        },
      ), //CalendarRegularContainer(onBack: back,),
      child: const CalendarList(), /*const Column(
        children: [
          ScheduleDescription(
            date: '8-12-2023',
            title: 'Tidak ada rencana  pengambilan sampling.',
            schedule: ['6 - 12 Agustus', '13 - 19 Agustus', '20 - 26 Agustus'],
            wo: [
              {'label':'WO.042022.00089', 'mark':'ongoing'},
              {'label':'WO.042022.00090', 'mark':'approve'},
              {'label':'WO.042022.00091', 'mark':'checklist'},
            ],
          )
        ]
      ),*/
    );
  }
}
