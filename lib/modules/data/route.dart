import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class DataRoute {
  static const String path = '/data';
  static const Key key = Key('__dataScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) =>DataScreen());

  static final BlocProvider bloc = BlocProvider<DataListBloc>(
      create: (BuildContext context) => DataListBloc(RepositoryProvider.of<DataListRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<DataListRepository>(
      create: (BuildContext context) => DataListRepository()
  );
}
