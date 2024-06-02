import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository _locationRepository;

  LocationBloc(LocationRepository locationRepository) : _locationRepository = locationRepository, super(const LocationState()) {
    on<GetLocationEvent>(_onLocation);
    on<GetCurrentLocationEvent>(_onCurrent);
    on<SetLocationEvent>(_onSend);
    on<SetLocationNoteEvent>(_onNote);
  }

  Future<void> _onLocation(GetLocationEvent event, Emitter<LocationState> emit) async {
    try {
      emit(state.copyWith(status: LocationStatus.loading));
      String s = await _locationRepository.getAddress(event.location.latitude!, event.location.longitude!);

      LocationModel m  = event.location.copyWith(address: s);
      emit(state.copyWith(location: m, status: LocationStatus.drop));
    } catch (e) {
      emit(state.copyWith(status: LocationStatus.failure));
    }
  }

  Future<void> _onCurrent(GetCurrentLocationEvent event, Emitter<LocationState> emit) async {
    try {
      emit(state.copyWith(status: LocationStatus.loading));
      LocationMap l = await _locationRepository.getCurrentLocation();
      emit(state.copyWith(status: l.status, location: l.location));
    } catch (e) {
      emit(state.copyWith(status: LocationStatus.failure));
    }
  }

  Future<void> _onSend(SetLocationEvent event, Emitter<LocationState> emit) async {
    try {
      emit(state.copyWith(status: LocationStatus.loading));
      LocationMap l = await _locationRepository.sendLocation(event.location);

      emit(state.copyWith(status: l.status));
    } catch (e) {
      emit(state.copyWith(status: LocationStatus.failure));
    }
  }

  void _onNote(SetLocationNoteEvent event, Emitter<LocationState> emit) {
    LocationModel m  = state.location.copyWith(note: event.note);
    emit(state.copyWith(location: m));
  }
}
