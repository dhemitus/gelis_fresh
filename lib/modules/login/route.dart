import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class LoginRoute {
  static const String path = '/login';
  static const Key key = Key('__loginScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const LoginScreen());

  static final BlocProvider bloc = BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(RepositoryProvider.of<AuthenticationRepository>(context))
  );
}