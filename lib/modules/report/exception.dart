import 'package:gelis/modules/modules.dart';

class ReportException implements Exception {
  final ReportWo message;

  ReportException(this.message);
}
