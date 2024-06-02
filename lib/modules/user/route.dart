import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class UserRoute {
  static const String path = '/user';
  static const Key key = Key('__userScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const UserScreen());

  static final RepositoryProvider repo = RepositoryProvider<UserRepository>(
      create: (BuildContext context) => UserRepository()
  );
}
