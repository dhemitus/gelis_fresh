import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class CalendarWo extends Equatable {
  final List<WoModel>? list;
  final CalendarStatus? status;

  const CalendarWo({this.list, this.status});

  @override
  List<Object?> get props => [list, status];

  CalendarWo copyWith({
    List<WoModel>? list,
    CalendarStatus? status
  }) => CalendarWo(
    list: list ?? this.list,
    status: status ?? this.status
  );
}
