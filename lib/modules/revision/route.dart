import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class RevisionRoute {
  static const String path = '/revision';
  static const Key key = Key('__revisionScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => RevisionScreen());

  static final BlocProvider bloc = BlocProvider<RevisionListBloc>(
      create: (BuildContext context) => RevisionListBloc(RepositoryProvider.of<RevisionListRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<RevisionListRepository>(
      create: (BuildContext context) => RevisionListRepository()
  );
}
