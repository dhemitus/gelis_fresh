import 'dart:convert';
import 'package:equatable/equatable.dart';

class WoStatusModel extends Equatable {
  final int? id, kode;
  final String? deskripsi;

  const WoStatusModel({this.id, this.kode, this.deskripsi});

  @override
  List<Object?> get props => [id, kode, deskripsi];

  WoStatusModel copyWith({
    int? id, kode,
    String? deskripsi
  }) => WoStatusModel(
    id: id ?? this.id,
    kode: kode ?? this.kode,
    deskripsi: deskripsi ?? this.deskripsi
  );

  factory WoStatusModel.fromMap(Map<String, dynamic> m) => WoStatusModel(
    id: m['id'] ?? 0,
    kode: m['kode'] ?? 0,
    deskripsi: m['deskripsi'] ?? ''
  );

  factory WoStatusModel.fromString(String s) => WoStatusModel.fromMap(jsonDecode(s));
}
