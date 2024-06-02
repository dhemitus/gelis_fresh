import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

class WoModel extends Equatable {
  final int? id,
    samplePerwakilanId,
    isSampleReceived; 
  final bool? parameterpengujianTakenLapangan,
    parameterpengujianTakenLab;
  final String? woNo,
    woTanggal,
    perusahaanNama,
    namaCp,
    telpCp,
    lokasi,
    //samplePerwakilanKode,
    tanggalRencana,
    tanggalRencanaSampai,
    jenisPengukuran,
    //ketua,
    //catatanApproval,
    //noQuotation,
    parameterpengujianDataTaken;
  final WoStatusModel? status;
  final List<WoMemberModel>? anggota;
  final List<WoSampleModel>? sample;
  //final List<WoTestParameterModel>? parameterpengujian;
  final List<WoModel>? list;


  const WoModel({
    this.id,
    this.samplePerwakilanId,
    this.isSampleReceived,
    this.parameterpengujianTakenLapangan,
    this.parameterpengujianTakenLab,
    this.woNo,
    this.woTanggal,
    this.perusahaanNama,
    this.namaCp,
    this.telpCp,
    this.lokasi,
    //this.samplePerwakilanKode,
    this.tanggalRencana,
    this.tanggalRencanaSampai,
    this.jenisPengukuran,
    //this.ketua,
    //this.catatanApproval,
    //this.noQuotation,
    this.parameterpengujianDataTaken,
    this.status,
    this.anggota,
    this.sample,
    //this.parameterpengujian,
    this.list
  });

  @override
  List<Object?> get props => [
    id,
    samplePerwakilanId,
    isSampleReceived,
    parameterpengujianTakenLapangan,
    parameterpengujianTakenLab,
    woNo,
    woTanggal,
    perusahaanNama,
    namaCp,
    telpCp,
    lokasi,
    //samplePerwakilanKode,
    tanggalRencana,
    tanggalRencanaSampai,
    jenisPengukuran,
    //ketua,
    //catatanApproval,
    //noQuotation,
    parameterpengujianDataTaken,
    status,
    anggota,
    sample,
    //parameterpengujian,
    list
  ];

  WoModel copyWith({
    int? id,
      samplePerwakilanId,
      isSampleReceived, 
    bool? parameterpengujianTakenLapangan,
      parameterpengujianTakenLab,
    String? woNo,
      woTanggal,
      perusahaanNama,
      namaCp,
      telpCp,
      lokasi,
      //samplePerwakilanKode,
      tanggalRencana,
      tanggalRencanaSampai,
      jenisPengukuran,
      //ketua,
      //catatanApproval,
      noQuotation,
      parameterpengujianDataTaken,
    WoStatusModel? status,
    List<WoMemberModel>? anggota,
    List<WoSampleModel>? sample,
    //List<WoTestParameterModel>? parameterpengujian,
    List<WoModel>? list
  }) => WoModel(
    id: id ?? this.id,
    samplePerwakilanId: samplePerwakilanId ?? this.samplePerwakilanId,
    isSampleReceived: isSampleReceived ?? this.isSampleReceived,
    parameterpengujianTakenLapangan: parameterpengujianTakenLapangan ?? this.parameterpengujianTakenLapangan,
    parameterpengujianTakenLab: parameterpengujianTakenLab ?? this.parameterpengujianTakenLab,
    woNo: woNo ?? this.woNo,
    woTanggal: woTanggal ?? this.woTanggal,
    perusahaanNama: perusahaanNama ?? this.perusahaanNama,
    namaCp: namaCp ?? this.namaCp,
    telpCp: telpCp ?? this.telpCp,
    lokasi: lokasi ?? this.lokasi,
    //samplePerwakilanKode: samplePerwakilanId ?? this.samplePerwakilanId,
    tanggalRencana: tanggalRencana ?? this.tanggalRencana,
    tanggalRencanaSampai: tanggalRencanaSampai ?? this.tanggalRencanaSampai,
    jenisPengukuran: jenisPengukuran ?? this.jenisPengukuran,
    //ketua: ketua ?? this.ketua,
    //catatanApproval: catatanApproval ?? this.catatanApproval,
    //noQuotation: noQuotation ?? this.noQuotation,
    parameterpengujianDataTaken: parameterpengujianDataTaken ?? this.parameterpengujianDataTaken,
    status: status ?? this.status,
    anggota: anggota ?? this.anggota,
    //sample: sample ?? this.sample,
    //parameterpengujian: parameterpengujian ?? this.parameterpengujian,
    list: list ?? this.list
  );

  factory WoModel.fromMap(Map<String, dynamic> m) => WoModel(
    id: m['id'] ?? 0,
    samplePerwakilanId: m['sample_perwakilan_id'] ?? 0,
    isSampleReceived: m['is_sample_received'] ?? 0,
    parameterpengujianTakenLapangan: m['parameterpengujian_taken_lapangan'] ?? false,
    parameterpengujianTakenLab: m['parameterpengujian_taken_lab'] ?? false,
    woNo: m['wo_no'] ?? '',
    woTanggal: m['wo_tanggal'] ?? '',
    perusahaanNama: m['perusahaan_nama'] ?? '',
    namaCp: m['nama_cp'] ?? '',
    telpCp: m['telp_cp'] ?? '',
    lokasi: m['lokasi'] ?? '',
    //samplePerwakilanKode: m['sample_perwakilan_kode'] ?? '',
    tanggalRencana: m['tanggal_rencana'] ?? '',
    tanggalRencanaSampai: m['tanggal_rencana_sampai'] ?? '',
    jenisPengukuran: m['jenis_pengukuran'] ?? '',
    //ketua: m['ketua'] ?? '',
    //catatanApproval: m['catatan_approval'] ?? '',
    //noQuotation: m['no_quotation'] ?? '',
    parameterpengujianDataTaken: m['parameterpengujian_data_taken'] ?? '',
    status: m['status'] != null ? WoStatusModel.fromMap(m['status']) : null,
    anggota: m['anggota'] != null ? WoMemberModel.fromList(m['anggota']).list : [],
    sample: m['sample'] != null ? WoSampleModel.fromList(m['sample']).list : [],
    //parameterpengujian: m['parameterpengujian'] != null ? WoTestParameterModel.fromList(m['parameterpengujian']).list : []
  );

  factory WoModel.fromList(List l) {
    List<WoModel> list = [];
    l.map((a) => list.add(WoModel.fromMap(a))).toList();
    return WoModel(list: list);
  }

  static Map<String, dynamic> toStatus(int n) => {
    'status': n.toString()
  };

  static Map<String, dynamic> toSearch(int n, {String search = '', int limit = 0, int skip = 0}) => {
    'status': n.toString(),
    'perusahaan_nama': search,
    'limit': limit.toString(),
    'skip': skip.toString()
  };

  static Map<String, dynamic> toSearchOnly({String search = '', int limit = 0, int skip = 0}) => {
    'perusahaan_nama': search,
    'limit': limit.toString(),
    'skip': skip.toString()
  };

  static Map<String, dynamic> toDate(String d, {int limit = 0, int skip = 0}) => {
    'tanggal_rencana': d,
    'limit': limit.toString(),
    'skip': skip.toString()
  };

  String toTransfer(int status) => jsonEncode({
    'id': id.toString(),
    'status': status.toString()
  });

  String get no => woNo ?? '';
}
