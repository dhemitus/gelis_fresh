import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class HistoryRoute {
  static const String path = '/history';
  static const Key key = Key('__historyScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => HistoryScreen());

  static final BlocProvider bloc = BlocProvider<HistoryListBloc>(
      create: (BuildContext context) => HistoryListBloc(RepositoryProvider.of<HistoryListRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<HistoryListRepository>(
      create: (BuildContext context) => HistoryListRepository()
  );
}
