import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class ApproveRoute {
  static const String path = '/approvewo';
  static const Key key = Key('__approveWoScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => ApproveWoScreen());

  static final BlocProvider bloc = BlocProvider<ApproveWoListBloc>(
      create: (BuildContext context) => ApproveWoListBloc(RepositoryProvider.of<ApproveWoListRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<ApproveWoListRepository>(
      create: (BuildContext context) => ApproveWoListRepository()
  );
}
