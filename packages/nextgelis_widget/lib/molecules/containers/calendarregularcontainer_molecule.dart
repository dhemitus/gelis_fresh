import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarRegularContainer extends StatelessWidget {
  final Widget? icon;
  final SignStyle? style;
  final Color? color;
  final VoidCallback? onBack;
  final DateTime? selected, focused, first, last;
  final void Function(DateTime, DateTime)? onSelect;
  final void Function(DateTime)? onPage;


  const CalendarRegularContainer({Key? key, this.icon, this.style = SignStyle.line, this.color, this.onBack, this.onSelect, this.onPage, this.selected, this.focused, this.first, this.last}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: 72.0.w,
      child: TableCalendar(
        onPageChanged: onPage,
        selectedDayPredicate: (d) => isSameDay(d, selected),
        onDaySelected: onSelect,
        focusedDay: focused!, 
        firstDay: first!, 
        lastDay: last!,
        calendarFormat: CalendarFormat.month,
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: HeaderStyle(
          titleCentered: false, 
          formatButtonVisible: false,
          rightChevronVisible: false,
          leftChevronIcon: TurnBackButton(onTap: onBack)
        ),
        calendarBuilders: CalendarBuilders(
          todayBuilder: (context, date, focusedDay) => NowDateContainer(text: date.day.toString()),
          selectedBuilder: (context, date, focusedDay) => CustomDateContainer(text: date.day.toString()),
        ),
      ),
    );
  }
}
