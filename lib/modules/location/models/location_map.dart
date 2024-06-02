import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class LocationMap extends Equatable {
  final LocationModel? location;
  final LocationStatus? status;

  const LocationMap({this.location, this.status});

  @override
  List<Object?> get props => [location, status];

  LocationMap copyWith({
    LocationModel? location,
    LocationStatus? status
  }) => LocationMap(
    location: location ?? this.location,
    status: status ?? this.status
  );
}
