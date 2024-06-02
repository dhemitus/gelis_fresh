part of './bloc.dart';

enum LocationStatus { loading, success, failure, detail, idle, drop }

class LocationState extends Equatable {
  final LocationStatus status;
  final LocationModel location;

  const LocationState({
    this.status = LocationStatus.loading,
    this.location = const LocationModel()
  });

  LocationState copyWith({
    LocationStatus? status,
    LocationModel? location
  }) => LocationState(
    status: status ?? this.status,
    location: location ?? this.location
  );

  @override
  List<Object> get props => [status, location];
}
