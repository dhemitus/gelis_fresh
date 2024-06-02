part of './bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class GetLocationEvent extends LocationEvent {
  final LocationModel location;
  const GetLocationEvent(this.location);

  @override
  List<Object> get props => [location];
}

class GetCurrentLocationEvent extends LocationEvent {
  
}

class SetLocationEvent extends LocationEvent {
  final LocationModel location;
  const SetLocationEvent(this.location);

  @override
  List<Object> get props => [location];
}

class SetLocationNoteEvent extends LocationEvent {
  final String note;
  const SetLocationNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}
