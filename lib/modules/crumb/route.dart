import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class CrumbRoute {
  static final BlocProvider bloc = BlocProvider<CrumbBloc>(
    create: (BuildContext context) => CrumbBloc(RepositoryProvider.of(context)),
  );

  static final RepositoryProvider repo = RepositoryProvider<CrumbRepository>(
    create: (BuildContext context) => CrumbRepository(),
  );
}
