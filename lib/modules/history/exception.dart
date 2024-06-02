import 'package:gelis/modules/modules.dart';

class HistoryException implements Exception {
  final HistoryWo message;

  HistoryException(this.message);
}
