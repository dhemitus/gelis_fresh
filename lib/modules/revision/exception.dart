import 'package:gelis/modules/modules.dart';

class RevisionException implements Exception {
  final RevisionWo message;

  RevisionException(this.message);
}
