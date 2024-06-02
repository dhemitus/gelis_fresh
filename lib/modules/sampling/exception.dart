import 'package:gelis/modules/modules.dart';

class WoSampleException implements Exception {
  final SampleDetail message;

  WoSampleException(this.message);
}
