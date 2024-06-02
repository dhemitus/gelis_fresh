import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class AuthenticationRoute {
  static const String path = '/';
  static const Key key = Key('__authenticationScreen__');

  static final BlocProvider bloc = BlocProvider<AuthenticationBloc>(
    create: (BuildContext context) => AuthenticationBloc(RepositoryProvider.of<AuthenticationRepository>(context), RepositoryProvider.of<UserRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<AuthenticationRepository>(
      create: (BuildContext context) => AuthenticationRepository()
  );
}