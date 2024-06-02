import 'package:gelis/modules/modules.dart';

class ApprovedException implements Exception {
  final ApproveWo message;

  ApprovedException(this.message);
}
