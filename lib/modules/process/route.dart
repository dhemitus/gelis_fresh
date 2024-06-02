import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class ProcessRoute {
  static const String path = '/process';
  static const Key key = Key('__processScreen__');
  static Route<void> route = MaterialPageRoute<void>(
      builder: (_) => const ProcessScreen());

  static final BlocProvider bloc = BlocProvider<ProcessBloc>(
    create: (BuildContext context) => ProcessBloc(RepositoryProvider.of<ProcessRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<ProcessRepository>(
    create: (BuildContext context) => ProcessRepository(),
  );

}
