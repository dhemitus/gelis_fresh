import 'dart:convert';
import 'package:equatable/equatable.dart';

class WoToolModel extends Equatable {
  final int? id, samplingWoId;
  final String? kodeKategori, nama;
  final List<WoToolModel>? list;

  const WoToolModel({this.id, this.samplingWoId, this.kodeKategori, this.nama, this.list});

  @override
  List<Object?> get props => [id, samplingWoId, kodeKategori, nama, list];

  WoToolModel copyWith({
    int? id, samplingWoId,
    String? kodeKategori, nama,
    List<WoToolModel>? list
  }) => WoToolModel(
    id: id ?? this.id,
    samplingWoId: samplingWoId ?? this.samplingWoId,
    kodeKategori: kodeKategori ?? this.kodeKategori,
    nama: nama ?? this.nama,
    list: list ?? this.list
  );

  factory WoToolModel.fromMap(Map<String, dynamic> m) => WoToolModel(
    id: m['id'] ?? 0,
    samplingWoId: m['samplingwo_id'] ?? 0,
    kodeKategori: m['kode_kategori'] ?? '',
    nama: m['nama'] ?? ''
  );

  factory WoToolModel.fromList(List l) {
    List<WoToolModel> list = [];
    l.map((a) => list.add(WoToolModel.fromMap(a))).toList();
    return WoToolModel(list: list);
  }

  factory WoToolModel.fromString(String s) => WoToolModel.fromMap(jsonDecode(s));
}
