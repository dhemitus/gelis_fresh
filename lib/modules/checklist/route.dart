import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class CheckRoute {
  static const String path = '/check';
  static const Key key = Key('__checkListScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => CheckListScreen());

  static final BlocProvider bloc = BlocProvider<CheckListBloc>(
      create: (BuildContext context) => CheckListBloc(RepositoryProvider.of<CheckListRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<CheckListRepository>(
      create: (BuildContext context) => CheckListRepository()
  );
}
