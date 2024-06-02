part of './bloc.dart';

enum CalendarStatus { loading, success, failure, detail }

class CalendarState extends Equatable {
  final CalendarStatus status;
  //final List<ScheduleItem> list;
  //final ScheduleItem schedule;
  final List<WoModel> list;
  final WoModel wo;
  final WoMetaModel meta;
  final String date;


  const CalendarState({
    this.status = CalendarStatus.loading,
    this.list = const <WoModel>[],
    this.wo = const WoModel(),
    this.meta = const WoMetaModel(skip: 0, limit: 50, numrows: 0),
    this.date = ''
  });

  CalendarState copyWith({
    CalendarStatus? status,
    List<WoModel>? list,
    WoModel? wo,
    WoMetaModel? meta,
    String? date
  }) => CalendarState(
    status: status ?? this.status,
    list: list ?? this.list,
    wo: wo ?? this.wo,
    meta: meta ?? this.meta,
    date: date ?? this.date
  );

  @override
  List<Object> get props => [status, list, wo, meta, date];
}
