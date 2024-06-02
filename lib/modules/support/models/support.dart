import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class SupportModel extends Equatable {
  final WoMemberModel? member;
  final String? result, time;
  final int? id;

  const SupportModel({this.member, this.result, this.time, this.id});

  @override
  List<Object?> get props => [member, result, time, id];

  SupportModel copyWith({
    WoMemberModel? member,
    String? result, time,
    int? id
  }) => SupportModel(
    member: member ?? this.member,
    result: result ?? this.result,
    time: time ?? this.time,
    id: id ?? this.id
  );

  int toId() => id!;

  String toPost() {
    return jsonEncode({
      'hasil': result,
      'hasil_waktu_sampling': time,
      'hasil_waktu_kirim': time,
      'hasil_petugas_id': member!.id,
      'hasil_petugas_nama': member!.nama
    });
  }
}
