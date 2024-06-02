import 'package:gelis/modules/modules.dart';

class RevisedException implements Exception {
  final RevisedWo message;

  RevisedException(this.message);
}
