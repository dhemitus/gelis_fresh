/*import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/map/models/map.dart';
import 'package:gelis/modules/modules.dart';
*/
part './event.dart';
part './state.dart';

/*class MapsBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _mapRepository;

  MapsBloc(MapRepository mapRepository) : _mapRepository = mapRepository, super(const MapState()) {
    on<GetMapEvent>(_onMap);
  }
  
  void _onMap(GetMapEvent event, Emitter<MapState> emit) {
    emit(state.copyWith(map: event.map));
  }
}*/
