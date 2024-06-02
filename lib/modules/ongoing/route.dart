import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class OnGoingRoute {
  static const String path = '/ongoing';
  static const Key key = Key('__onGoingScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => OnGoingScreen());

  static final BlocProvider bloc = BlocProvider<OnGoingListBloc>(
      create: (BuildContext context) => OnGoingListBloc(RepositoryProvider.of<OnGoingListRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<OnGoingListRepository>(
      create: (BuildContext context) => OnGoingListRepository()
  );
}
