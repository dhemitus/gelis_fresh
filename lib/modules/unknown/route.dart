import 'package:flutter/material.dart';
import 'package:gelis/modules/modules.dart';

class UnknownRoute {
  static const String path = '/unknown';
  static const Key key = Key('__unknownScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const UnknownScreen());

}