import 'package:gelis/modules/modules.dart';

class TransferException implements Exception {
  final TransferWo message;

  TransferException(this.message);
}
