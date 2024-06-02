import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarRepository _calendarRepository;

  CalendarBloc(CalendarRepository calendarRepository) : _calendarRepository = calendarRepository, super(const CalendarState()) {
    on<GetCalendarListEvent>(_onLoad);
    on<GetCalendarDateEvent>(_onDate);
    on<SetCalendarDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetCalendarListEvent event, Emitter<CalendarState> emit) async {
    try {
      emit(state.copyWith(status: CalendarStatus.loading));
      CalendarWo l = await _calendarRepository.loadWoList(
        date: state.date,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, status: CalendarStatus.success));
    } catch(_) {
      emit(state.copyWith(status: CalendarStatus.failure));
    }
  }

  void _onDate(GetCalendarDateEvent event, Emitter<CalendarState> emit) {
    emit(state.copyWith(date: event.date));
  }

  void _onDetail(SetCalendarDetailEvent event, Emitter<CalendarState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
