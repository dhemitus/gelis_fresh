import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class HomeRoute {
  static const String path = '/home';
  static const Key key = Key('__homeScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => HomeScreen());
}
