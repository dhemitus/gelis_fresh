import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part './event.dart';
part './state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {

  NavigationBloc(GlobalKey<NavigatorState> navKey) :
  super(NavigationState(argument: const {}, navKey: navKey)) {
    on<OnBack>(_onBack);
    on<OnGo>(_onGo);
    on<OnGoAndCleanUntil>(_onGoAndCleanUntil);

  }

  void _onBack(OnBack event, Emitter<NavigationState> emit) {
    emit(state.copyWith(argument: event.argument));
    state.navKey!.currentState!.pop();
  }

  void _onGo(OnGo event, Emitter<NavigationState> emit) {
    emit(state.copyWith(argument: event.argument));
    state.navKey!.currentState!.pushNamed(event.path, arguments: event.argument);
  }

  void _onGoAndCleanUntil(OnGoAndCleanUntil event, Emitter<NavigationState> emit) {
    emit(state.copyWith(argument: event.argument));
    state.navKey!.currentState!.pushNamedAndRemoveUntil(event.path, (route) => false);
  }
}
