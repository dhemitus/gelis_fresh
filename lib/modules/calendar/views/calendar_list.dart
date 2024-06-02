import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CalendarList extends StatelessWidget {
  const CalendarList({Key? key}) : super(key: key);


  String _mark(int i) {
    switch (i) {
      case 2:
        return 'approve';
      case 4:
        return 'checklist';
      default:
        return 'ongoing';
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget list(List<WoModel> l) {
      return ScheduleDescription(
        date: context.read<CalendarBloc>().state.date,
        title: l.isEmpty ? 'Tidak ada rencana pengambilan sampling' : '',
        wo: l.map((e) => {'label': e.woNo, 'mark': _mark(e.status!.kode!), 'start': e.tanggalRencana, 'finish': e.tanggalRencanaSampai}).toList(),
      );
    }

    Widget switchIt(CalendarStatus e, List<WoModel> l) {
      switch(e) {
        case CalendarStatus.loading:
          return const LoadingContainer();
        case CalendarStatus.failure:
          return Container();
        case CalendarStatus.success:
          return list(l);
        default:
          return Container();
      }
    }

    return BlocBuilder<CalendarBloc, CalendarState>(
      buildWhen: (previous, current) => previous.list != current.list,
      builder: (BuildContext context, CalendarState state) {
        return switchIt(state.status, state.list);
      }
    );
  }
}
