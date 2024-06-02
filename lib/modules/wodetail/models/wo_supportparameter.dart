import 'dart:convert';
import 'package:equatable/equatable.dart';

class WoSupportParameterModel extends Equatable {
  final int? id, samplingWoId, hasilPetugasId, samplepengujianId;
  final String? parameterPendukung, hasil, satuan, hasilWaktuSampling, hasilWaktuKirim, hasilPetugasNama;
  final List<WoSupportParameterModel>? list;

  const WoSupportParameterModel({
    this.id,
    this.samplingWoId,
    this.hasilPetugasId,
    this.samplepengujianId,
    this.parameterPendukung,
    this.hasil,
    this.satuan,
    this.hasilWaktuSampling,
    this.hasilWaktuKirim,
    this.hasilPetugasNama,
    this.list
  });

  @override
  List<Object?> get props => [id, samplingWoId, hasil, hasilPetugasId, samplepengujianId, parameterPendukung, satuan, hasilWaktuSampling, hasilWaktuKirim, hasilPetugasNama, list];

  WoSupportParameterModel copyWith({
    int? id, samplingWoId, hasilPetugasId, samplepengujianId,
    String? parameterPendukung, hasil, satuan, hasilWaktuSampling, hasilWaktuKirim, hasilPetugasNama,
    List<WoSupportParameterModel>? list
  }) => WoSupportParameterModel(
    id: id ?? this.id,
    samplingWoId: samplingWoId ?? this.samplingWoId,
    hasilPetugasId: hasilPetugasId ?? this.hasilPetugasId,
    samplepengujianId: samplepengujianId ?? this.samplepengujianId,
    parameterPendukung: parameterPendukung ?? this.parameterPendukung,
    hasil: hasil ?? this.hasil,
    satuan: satuan ?? this.satuan,
    hasilWaktuSampling: hasilWaktuSampling ?? this.hasilWaktuSampling,
    hasilWaktuKirim: hasilWaktuKirim ?? this.hasilWaktuKirim,
    hasilPetugasNama: hasilPetugasNama ?? this.hasilPetugasNama,
    list: list ?? this.list
  );

  factory WoSupportParameterModel.fromMap(Map<String, dynamic> m) => WoSupportParameterModel(
    id: m['id'] ?? 0,
    samplingWoId: m['samplingwo_id'] ?? 0,
    hasil: m['hasil'] ?? 0,
    hasilPetugasId: m['hasil_petugas_id'] ?? 0,
    samplepengujianId: m['samplepengujian_id'] ?? 0,
    parameterPendukung: m['parameter_pendukung'] ?? '',
    satuan: m['satuan'] ?? '',
    hasilWaktuSampling: m['hasil_waktu_sampling'] ?? '',
    hasilWaktuKirim: m['hasil_waktu_kirim'] ?? '',
    hasilPetugasNama: m['hasil_petugas_nama'] ?? ''
  );

  factory WoSupportParameterModel.fromList(List l) {
    List<WoSupportParameterModel> list = [];
    l.map((a) => list.add(WoSupportParameterModel.fromMap(a))).toList();
    return WoSupportParameterModel(list: list);
  }

  factory WoSupportParameterModel.fromString(String s) => WoSupportParameterModel.fromMap(jsonDecode(s));
}
