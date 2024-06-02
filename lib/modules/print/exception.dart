import 'package:gelis/modules/modules.dart';

class PrintException implements Exception {
  final PrintWo message;

  const PrintException(this.message);
}
