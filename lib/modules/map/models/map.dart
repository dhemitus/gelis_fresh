import 'dart:convert';
import 'package:equatable/equatable.dart';

class MapModel extends Equatable {
  final int? id;
  final String? latitudeLongitude, location, address, note;
  const MapModel({this.id, this.latitudeLongitude, this.location, this.address, this.note});

  @override
  List<Object?> get props => [id, latitudeLongitude, location, address, note];

  MapModel copyWith({
    final int? id,
    final String? latitudeLongitude, location, address, note
  }) => MapModel(
    id: id ?? this.id,
    latitudeLongitude: latitudeLongitude ?? this.latitudeLongitude,
    location: location ?? this.location,
    address: address ?? this.address,
    note: note ?? this.note
  );

  Map<String, dynamic> toMap() => {
    'sampleId': id,
    'hasil_latitude_longitude': latitudeLongitude,
    'hasil_lokasi': location,
    'hasil_abnormalitas': note
  };

  String toPost() => jsonEncode(toMap());

}
