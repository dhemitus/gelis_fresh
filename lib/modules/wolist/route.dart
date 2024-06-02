import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class WoListRoute {
  static const String path = '/wolist';
  static const Key key = Key('__homeScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const WoListScreen());

  static final BlocProvider bloc = BlocProvider<WoListBloc>(
      create: (BuildContext context) => WoListBloc(RepositoryProvider.of<WoListRepository>(context))..add(GetWoListEvent())
  );

  static final RepositoryProvider repo = RepositoryProvider<WoListRepository>(
      create: (BuildContext context) => WoListRepository()
  );
}
