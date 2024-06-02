import 'package:gelis/modules/modules.dart';

class WoException implements Exception {
  final ApproveWo message;

  WoException(this.message);
}
