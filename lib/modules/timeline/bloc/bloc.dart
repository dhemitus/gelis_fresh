import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part './event.dart';
part './state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc() : super(TimelineState()) {
    on<SetSelectTimelineEvent>(_onSelect);
    on<SetPageTimelineEvent>(_onPage);
  }

  void _onSelect(SetSelectTimelineEvent event, Emitter<TimelineState> emit) {
    emit(state.copyWith(status: TimelineStatus.loading));
    emit(state.copyWith(selected: event.selected, focused: event.focused, status: TimelineStatus.success));
  }

  void _onPage(SetPageTimelineEvent event, Emitter<TimelineState> emit) {
    emit(state.copyWith(status: TimelineStatus.loading));
    emit(state.copyWith(focused: event.focused, status: TimelineStatus.success));
  }
} 
