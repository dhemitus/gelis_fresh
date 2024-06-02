import 'package:gelis/modules/modules.dart';

class LocationException implements Exception {
  final LocationMap message;

  LocationException(this.message);
}
