import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class WoDetailRoute {
  static const String path = '/wodetail';
  static const Key key = Key('__woDetailScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const WoDetailScreen());

  static final BlocProvider bloc = BlocProvider<WoDetailBloc>(
      create: (BuildContext context) => WoDetailBloc(RepositoryProvider.of<WoDetailRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<WoDetailRepository>(
      create: (BuildContext context) => WoDetailRepository()
  );

}