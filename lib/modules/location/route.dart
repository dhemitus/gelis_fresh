import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class LocationRoute {
  static final BlocProvider bloc = BlocProvider<LocationBloc>(
    create: (BuildContext context) => LocationBloc(RepositoryProvider.of<LocationRepository>(context)),
  );

  static final RepositoryProvider repo = RepositoryProvider<LocationRepository>(
    create: (BuildContext context) => LocationRepository(),
  );
}
