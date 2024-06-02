import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class MenuRoute {

  static final BlocProvider bloc = BlocProvider<MenuBloc>(
      create: (BuildContext context) => MenuBloc(RepositoryProvider.of<MenuListRepository>(context))
  );

  static final RepositoryProvider repo = RepositoryProvider<MenuListRepository>(
      create: (BuildContext context) => MenuListRepository()
  );
}
