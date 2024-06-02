import 'dart:convert';
import 'package:equatable/equatable.dart';

class WoMemberModel extends Equatable {
  final int? id, userId, samplingWoId;
  final String? jabatan, nama;
  final List<WoMemberModel>? list;

  const WoMemberModel({this.id, this.userId, this.samplingWoId, this.jabatan, this.nama, this.list});
  
  @override
  List<Object?> get props => [id, userId, samplingWoId, jabatan, nama, list];

  WoMemberModel copyWith({
    int? id, userId, samplingWoId,
    String? jabatan, nama,
    List<WoMemberModel>? list
  }) => WoMemberModel(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    samplingWoId: samplingWoId ?? this.samplingWoId,
    jabatan: jabatan ?? this.jabatan,
    nama: nama ?? this.nama,
    list: list ?? this.list
  );

  factory WoMemberModel.fromList(List l) {
    List<WoMemberModel> list = [];

    l.map((a) => list.add(WoMemberModel.fromMap(a))).toList();

    return WoMemberModel(list: list);
  } 

  factory WoMemberModel.fromMap(Map<String, dynamic> m) => WoMemberModel(
    id: m['id'] ?? 0,
    userId: m['user_id']  ?? 0,
    samplingWoId: m['samplingwo_id'] ?? 0,
    jabatan: m['jabatan'] ?? '',
    nama: m['nama'] ?? ''
  );

  factory WoMemberModel.fromString(String s) => WoMemberModel.fromMap(jsonDecode(s));
}
