import 'package:equatable/equatable.dart';

class HistoryModel extends Equatable {
  final String? id, serial, title, company, calendar, contact, location, locate, type, picture, status, date;
  const HistoryModel({
    this.id, 
    this.serial, 
    this.title, 
    this.company, 
    this.calendar, 
    this.contact, 
    this.location, 
    this.locate, 
    this.type, 
    this.picture, 
    this.status,
    this.date
  });

  HistoryModel copyWith({
    String? id, serial, title, company, calendar, contact, location, locate, type, picture, status, date
  }) => HistoryModel(
    id: id ?? this.id,
    serial: serial ?? this.serial,
    title: title ?? this.title,
    company: company ?? this.company,
    calendar: calendar ?? this.calendar,
    contact: contact ?? this.contact,
    location: location ?? this.location,
    locate: locate ?? this.locate,
    type: type ?? this.type,
    picture: picture ?? this.picture,
    status: status ?? this.status,
    date: date ?? this.date
  );

  factory HistoryModel.fromMap(Map<String, dynamic> m) => HistoryModel(
    id: m['id'] ?? '',
    serial: m['serial'] ?? '',
    title: m['title'] ?? '',
    company: m['company'] ?? '',
    calendar: m['calendar'] ?? '',
    contact: m['contact'] ?? '',
    location: m['location'] ?? '',
    locate: m['locate'] ?? '',
    type: m['type'] ?? '',
    picture: m['picture'] ?? '',
    status: m['status'] ?? '',
    date: m['date'] ?? ''
  );

  @override
  List<Object?> get props => [id, serial, title, company, calendar, contact, location, locate, type, picture, status, date];
}
