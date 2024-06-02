import 'package:equatable/equatable.dart';

class WoDetailItem extends Equatable {
  final String? serial, title, company, location, locate, contact, type;
  const WoDetailItem({this.serial, this.title, this.company, this.location, this.locate, this.contact, this.type});

  WoDetailItem copyWith({
    String? serial, title, company, location, locate, contact, type
  }) => WoDetailItem(
      serial: serial ?? this.serial,
      title: title ?? this.title,
      company: company ?? this.company,
      location: location ?? this.location,
      locate: locate ?? this.locate,
      contact: contact ?? this.contact,
      type: type ?? this.type
  );

  factory WoDetailItem.fromMap(Map _m) => WoDetailItem(
      serial: _m['serial'] ?? '',
      title: _m['title'] ?? '',
      company: _m['company'] ?? '',
      location: _m['location'] ?? '',
      locate: _m['locate'] ?? '',
      contact: _m['contact'] ?? '',
      type: _m['type'] ?? ''
  );

  @override
  List<Object?> get props => [serial, title, company, location, locate, contact, type];
}
