import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class SupportRoute {
  static const String path = '/support';
  static const Key key = Key('__supportScreen__');
  static Route<void> route = MaterialPageRoute<void>(
      builder: (_) => const SupprtScreen());
  
  static final BlocProvider bloc = BlocProvider<SupportBloc>(
    create: (BuildContext context) => SupportBloc(RepositoryProvider.of<SupportRepository>(context)),
  );

  static final RepositoryProvider repo = RepositoryProvider<SupportRepository>(
    create: (BuildContext context) => SupportRepository(),
  );
}
