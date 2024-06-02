import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class FrontRoute {
  static const String path = '/front';
  static const Key key = Key('__frontScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const FrontScreen());

  static final BlocProvider bloc = BlocProvider<FrontBloc>(
      create: (BuildContext context) => FrontBloc(RepositoryProvider.of<FrontRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<FrontRepository>(
      create: (BuildContext context) => FrontRepository()
  );
}
