import 'package:equatable/equatable.dart';

class ScheduleItem extends Equatable {
  final String? id, title, date;
  final List<String>? schedule;
  final List<Map<String, String>>? wo;

  const ScheduleItem({this.id, this.date, this.title, this.schedule = const [], this.wo = const []});

  @override
  List<Object?> get props => [id, date, title, schedule, wo];

  ScheduleItem copyWith({
    String? id, title, date,
    List<String>? schedule,
    List<Map<String, String>>? wo
  }) => ScheduleItem(
    id: id ?? this.id,
    title: title ?? this.title,
    date: date ?? this.date,
    schedule: schedule ?? this.schedule,
    wo: wo ?? this.wo
  );

  factory ScheduleItem.fromMap(Map<String, dynamic> m) => ScheduleItem(
    id: m['id'] ?? '',
    title: m['title'] ?? '',
    date: m['date'] ?? '',
    schedule: m['schedule'] ?? [],
    wo: m['wo'] ?? []
  );

}
