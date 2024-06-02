import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class TransferRoute {
  static final BlocProvider bloc = BlocProvider<TransferBloc>(
    create: (BuildContext context) => TransferBloc(RepositoryProvider.of<TransferRepository>(context)),
  );

  static final RepositoryProvider repo = RepositoryProvider<TransferRepository>(
    create: (BuildContext context) => TransferRepository()
  );
}
