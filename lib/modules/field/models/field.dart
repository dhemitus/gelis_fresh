import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class FieldModel extends Equatable {
  final String? first, last, test, simplo, duplo, flat, rdp, note, actual, verify;
  final WoMemberModel? member;
  final WoTestParameterModel? detail;
  final int? id, range, quality, quantity, flow;

  const FieldModel({
    this.first,
    this.last,
    this.test,
    this.simplo,
    this.duplo,
    this.flat,
    this.rdp,
    this.note,
    this.actual,
    this.verify,
    this.range,
    this.quality,
    this.quantity,
    this.flow,
    this.member,
    this.detail,
    this.id
  });

  FieldModel copyWith({
    String? first, last, test, simplo, duplo, flat, rdp, note, actual, verify,
    WoMemberModel? member,
    WoTestParameterModel? detail,
    int? id, range, quality, quantity, flow
  }) => FieldModel(
    first: first ?? this.first,
    last: last ?? this.last,
    test: test ?? this.test,
    simplo: simplo ?? this.simplo,
    duplo: duplo ?? this.duplo,
    flat: flat ?? this.flat,
    rdp: rdp ?? this.rdp,
    note: note ?? this.note,
    actual: actual ?? this.actual,
    verify: verify ?? this.verify,
    range: range ?? this.range,
    quality: quality ?? this.quality,
    quantity: quantity ?? this.quantity,
    flow: flow ?? this.flow,
    member: member ?? this.member,
    detail: detail ?? this.detail,
    id: id ?? this.id
  );

  @override
  List<Object?> get props => [first, last, test, simplo, duplo, flat, rdp, note, actual, verify, range, quality, quantity, flow, member, detail, id];

  int toId() => id ?? 0;

  String toPost() => jsonEncode({
    'checked_pengukuran_sesaat': range,
    'checked_kualitatif': quality,
    'hasil_pengujian_kualitatif': quality,
    'catatan_pengujian_kualitatif': note,
    'hasil_pengujian': test,
    'hasil_simplo': simplo,
    'hasil_duplo': duplo,
    'hasil_rataan': flat,
    'hasil_rdp': rdp,
    'checked_pengukuran_flow_actual': flow,
    'pengukuran_flow_actual': actual,
    'hasil_waktu_pengukuran': first,
    'hasil_waktu_pengukuran_akhir': last,
    'hasil_waktu_kirim': first,
    'hasil_status_verifikasi': verify,
    'hasil_petugas_id': member!.id,
    'hasil_petugas_nama': member!.nama
  });
}
