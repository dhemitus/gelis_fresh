import 'dart:convert';
import 'package:equatable/equatable.dart';

class WoPaperModel extends Equatable {
  final int? id, samplingWoId, quoparameterPengujianId, volume;
  final String? blankoKode, blankoNama, blankoLabel, parameterujiNama, wadah;
  final List<WoPaperModel>? list;

  const WoPaperModel({
    this.id,
    this.samplingWoId,
    this.quoparameterPengujianId,
    this.volume,
    this.blankoKode,
    this.blankoNama,
    this.blankoLabel,
    this.parameterujiNama,
    this.wadah,
    this.list
  });

  @override
  List<Object?> get props => [id, samplingWoId, quoparameterPengujianId, volume, blankoKode, blankoNama, blankoLabel, parameterujiNama, wadah, list];

  WoPaperModel copyWith({
    int? id, samplingWoId, quoparameterPengujianId, volume,
    String? blankoKode, blankoNama, blankoLabel, parameterujiNama, wadah,
    List<WoPaperModel>? list
  }) => WoPaperModel(
    id: id ?? this.id,
    samplingWoId: samplingWoId ?? this.samplingWoId,
    quoparameterPengujianId: quoparameterPengujianId ?? this.quoparameterPengujianId,
    volume: volume ?? this.volume,
    blankoKode: blankoKode ?? this.blankoKode,
    blankoNama: blankoNama ?? this.blankoNama,
    blankoLabel: blankoLabel ?? this.blankoLabel,
    parameterujiNama: parameterujiNama ?? this.parameterujiNama,
    wadah: wadah ?? this.wadah,
    list: list ?? this.list
  );

  factory WoPaperModel.fromMap(Map<String, dynamic> m) => WoPaperModel(
    id: m['id'] ?? 0,
    samplingWoId: m['samplingwo_id'] ?? 0,
    quoparameterPengujianId: m['quoparameterpengujian_id'] ?? 0,
    volume: m['volume'] ?? 0,
    blankoKode: m['blanko_kode'] ?? '',
    blankoNama: m['blanko_nama'] ?? '',
    blankoLabel: m['blanko_label'] ?? '',
    parameterujiNama: m['parameteruji_nama'] ?? '',
    wadah: m['wadah'] ?? ''
  );

  factory WoPaperModel.fromList(List l) {
    List<WoPaperModel> list = [];
    l.map((a) => list.add(WoPaperModel.fromMap(a))).toList();
    return WoPaperModel(list: list);
  }

  factory WoPaperModel.fromString(String s) => WoPaperModel.fromMap(jsonDecode(s));
}
