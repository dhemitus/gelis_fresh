import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class ProcessModel extends Equatable {
  final WoMemberModel? member;
  final String? note, plate, result;
  final bool? done;
  final int? id;
  final List<WoTestParameterModel>? testparam;

  const ProcessModel({this.member, this.plate, this.result, this.note, this.done, this.id, this.testparam});

  @override
  List<Object?> get props => [member, plate, result, note, done, id, testparam];

  ProcessModel copyWith({
    WoMemberModel? member,
    String? note, plate, result,
    bool? done,
    int? id,
    List<WoTestParameterModel>? testparam
  }) => ProcessModel(
    member: member ?? this.member,
    note: note ?? this.note,
    plate: plate ?? this.plate,
    result: result ?? this.result,
    done: done ?? this.done,
    id: id ?? this.id,
    testparam: testparam ?? this.testparam
  );

  int toId() => id ?? 0;

  String toPost() {
    List<Map<String, dynamic>> l = [];
    testparam!.map((e) {
      l.add({
        'id': e.id,
        'hasil_isdone': done! ? 1 : 0,
        'hasil_waktu_sampling': result,
        'hasil_waktu_kirim': result,
        'hasil_catatan_pengambilan': note,
        'hasil_petugas_id': member!.id ?? '',
        'hasil_petugas_nama': member!.nama ?? ''
      });
    }).toList();
    return jsonEncode({
      'paramUji': l,
      'kode_wadah': plate
    });
  }
}
