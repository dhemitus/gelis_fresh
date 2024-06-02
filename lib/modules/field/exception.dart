import 'package:gelis/modules/modules.dart';

class FieldException implements Exception {
  final FieldWo message;

  const FieldException(this.message);
}
