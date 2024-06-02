import 'package:gelis/modules/modules.dart';

class UserException implements Exception {
  final User message;

  UserException(this.message);
}
