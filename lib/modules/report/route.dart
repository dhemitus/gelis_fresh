import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class ReportRoute {
  static const String path = '/report';
  static const Key key = Key('__reportScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => ReportScreen());

  static final BlocProvider bloc = BlocProvider<ReportListBloc>(
      create: (BuildContext context) => ReportListBloc(RepositoryProvider.of<ReportListRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<ReportListRepository>(
      create: (BuildContext context) => ReportListRepository()
  );
}
