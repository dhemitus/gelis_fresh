import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class TimelineRoute {

  static final BlocProvider bloc = BlocProvider<TimelineBloc>(
      create: (BuildContext context) => TimelineBloc()
  );
}
