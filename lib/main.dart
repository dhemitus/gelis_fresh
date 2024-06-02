import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:gelis/app.dart';
import 'package:gelis/domain/domain.dart';

Future<void> main() async {
  Utils.initSystem();
  await initializeDateFormatting('id_ID', null).then((_) =>
  runApp(App()));
}
