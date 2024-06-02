import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class FieldRoute {
  static const String path = '/field';
  static const Key key = Key('__fieldScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const FieldScreen());

  static final BlocProvider bloc = BlocProvider<FieldBloc>(
    create: (BuildContext context) => FieldBloc(RepositoryProvider.of<FieldRepository>(context)),
  );

  static final RepositoryProvider repo = RepositoryProvider<FieldRepository>(
    create: (BuildContext context)=> FieldRepository(),
  );
}
