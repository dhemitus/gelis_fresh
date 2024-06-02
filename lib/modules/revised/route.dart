import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class RevisedRoute {
  static const String path = '/revised';
  static const Key key = Key('__revisedScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => RevisedScreen());

  static final BlocProvider bloc = BlocProvider<RevisedListBloc>(
      create: (BuildContext context) => RevisedListBloc(RepositoryProvider.of<RevisedListRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<RevisedListRepository>(
      create: (BuildContext context) => RevisedListRepository()
  );
}
