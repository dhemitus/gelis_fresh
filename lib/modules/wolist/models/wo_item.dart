import 'package:equatable/equatable.dart';

class WoItem extends Equatable {
  final String? id, serial, title, company, calendar, contact, location, locate, type, status;
  const WoItem({this.id, this.serial, this.title, this.company, this.calendar, this.contact, this.location, this.locate, this.type, this.status});

  WoItem copyWith({
    String? id, serial, title, company, calendar, contact, location, locate, type, status
  }) => WoItem(
    id: id ?? this.id,
    serial: serial ?? this.serial,
    title: title ?? this.title,
    company: company ?? this.company,
    calendar: calendar ?? this.calendar,
    contact: contact ?? this.contact,
    location: location ?? this.location,
    locate: locate ?? this.locate,
    type: type ?? this.type,
    status: status ?? this.status
  );

  factory WoItem.fromMap(Map<String, dynamic> m) => WoItem(
    id: m['id'] ?? '',
    serial: m['serial'] ?? '',
    title: m['title'] ?? '',
    company: m['company'] ?? '',
    calendar: m['calendar'] ?? '',
    contact: m['contact'] ?? '',
    location: m['location'] ?? '',
    locate: m['locate'] ?? '',
    type: m['type'] ?? '',
    status: m['status'] ?? ''
  );

  @override
  List<Object?> get props => [id, serial, title, company, calendar, contact, location, locate, type, status];
}
