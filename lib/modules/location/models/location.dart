import 'dart:convert';
import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final int? id;
  final String? latitudeLongitude, location, address, note;
  final double? latitude, longitude;
  const LocationModel({this.id, this.latitudeLongitude, this.location, this.address, this.note, this.latitude, this.longitude});

  @override
  List<Object?> get props => [id, latitudeLongitude, location, address, note, latitude, longitude];

  LocationModel copyWith({
    final int? id,
    final double? latitude, longitude,
    final String? latitudeLongitude, location, address, note
  }) => LocationModel(
    id: id ?? this.id,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    latitudeLongitude: latitudeLongitude ?? this.latitudeLongitude,
    location: location ?? this.location,
    address: address ?? this.address,
    note: note ?? this.note
  );

  Map<String, dynamic> toMap() => {
    'sampleId': id,
    'hasil_latitude_longitude': latitudeLongitude,
    'hasil_lokasi': location ?? '',
    'hasil_abnormalitas': note ?? 'tidak ada'
  };

  String toPost() => jsonEncode(toMap());

}
