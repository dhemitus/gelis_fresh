import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class NavigationRoute {

  static BlocProvider bloc(GlobalKey<NavigatorState> key) => BlocProvider<NavigationBloc>(
      create: (BuildContext context) => NavigationBloc(key)
  );
}