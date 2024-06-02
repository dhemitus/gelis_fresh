import 'package:gelis/modules/modules.dart';

class CalendarException implements Exception {
  final CalendarWo message;

  CalendarException(this.message);
}
