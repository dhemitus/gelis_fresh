import 'package:gelis/modules/modules.dart';

class ChecklistException implements Exception {
  final ChecklistWo message;

  ChecklistException(this.message);
}
