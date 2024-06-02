import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class CalendarRoute {
  static const String path = '/calendar';
  static const Key key = Key('__calendarScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const CalendarScreen());
 
  static final BlocProvider bloc = BlocProvider<CalendarBloc>(
      create: (BuildContext context) => CalendarBloc(RepositoryProvider.of<CalendarRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<CalendarRepository>(
      create: (BuildContext context) => CalendarRepository()
  );

}
