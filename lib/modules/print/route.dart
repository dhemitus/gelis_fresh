import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class PrintRoute {
  static const String path = '/print';
  static const Key key = Key('__printScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const PrintScreen());

  static final BlocProvider bloc = BlocProvider<PrintBloc>(
    create: (BuildContext context) => PrintBloc(RepositoryProvider.of<PrintRepository>(context)),
  );

  static final RepositoryProvider repo = RepositoryProvider<PrintRepository>(
    create: (BuildContext context) => PrintRepository()
  );
}
