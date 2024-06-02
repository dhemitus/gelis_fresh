import 'package:gelis/modules/modules.dart';

class ProcessException implements Exception {
  final ProcessWo message;

  ProcessException(this.message);
}
