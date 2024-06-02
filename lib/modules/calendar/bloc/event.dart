part of './bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

class GetCalendarListEvent extends CalendarEvent {}

class GetCalendarInitEvent extends CalendarEvent {}

class GetCalendarDateEvent extends CalendarEvent {
  final String date;
  const GetCalendarDateEvent(this.date);
  
  @override
  List<Object> get props => [date];

}

class GetCalendarMetaEvent extends CalendarEvent {
  final WoMetaModel meta;
  const GetCalendarMetaEvent(this.meta);
  
  @override
  List<Object> get props => [meta];

}

class SetCalendarDetailEvent extends CalendarEvent {
  final WoModel wo;
  const SetCalendarDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
