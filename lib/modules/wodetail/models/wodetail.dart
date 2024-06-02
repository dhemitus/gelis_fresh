import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class WoDetailModel extends Equatable {
  final int? id, isSampleReceived, samplePerwakilanId;
  final String? woNo,
    woTanggal,
    perusahaanNama,
    namaCp,
    telpCp,
    lokasi,
    samplePerwakilanKode,
    tanggalRencana,
    tanggalRencanaSampai,
    jenisPengukuran,
    ketua,
    catatanApproval;
  final WoStatusModel? status;
  final List<WoMemberModel>? anggota;
  final List<WoSampleModel>? sample;
  final List<WoToolModel>? peralatan;
  final List<WoPaperModel>? blanko;
  final List<WoTestParameterModel>? parameterpengujian;
  final List<WoSupportParameterModel>? parameterpendukung;
  final List<WoDetailModel>? list;

  const WoDetailModel({
    this.id,
    this.isSampleReceived,
    this.samplePerwakilanId,
    this.woNo,
    this.woTanggal,
    this.perusahaanNama,
    this.namaCp,
    this.telpCp,
    this.lokasi,
    this.samplePerwakilanKode,
    this.tanggalRencana,
    this.tanggalRencanaSampai,
    this.jenisPengukuran,
    this.ketua,
    this.catatanApproval,
    this.status,
    this.anggota,
    this.sample,
    this.peralatan,
    this.blanko,
    this.parameterpengujian,
    this.parameterpendukung,
    this.list
  });

  @override
  List<Object?> get props => [
    id,
    isSampleReceived,
    samplePerwakilanId,
    woNo,
    woTanggal,
    perusahaanNama,
    namaCp,
    telpCp,
    lokasi,
    samplePerwakilanKode,
    tanggalRencana,
    tanggalRencanaSampai,
    jenisPengukuran,
    ketua,
    catatanApproval,
    status,
    anggota,
    sample,
    peralatan,
    parameterpengujian,
    parameterpendukung,
    blanko,
    list
  ];

  WoDetailModel copyWith({
    int? id, isSampleReceived, samplePerwakilanId,
    String? woNo,
    woTanggal,
    perusahaanNama,
    namaCp,
    telpCp,
    lokasi,
    samplePerwakilanKode,
    tanggalRencana,
    tanggalRencanaSampai,
    jenisPengukuran,
    ketua,
    catatanApproval,
    WoStatusModel? status,
    List<WoToolModel>? peralatan,
    List<WoPaperModel>? blanko,
    List<WoMemberModel>? anggota,
    List<WoSampleModel>? sample,
    List<WoTestParameterModel>? parameterpengujian,
    final List<WoSupportParameterModel>? parameterpendukung,
    List<WoDetailModel>? list
  }) => WoDetailModel(
    id: id ?? this.id,
    isSampleReceived: isSampleReceived ?? this.isSampleReceived,
    samplePerwakilanId: samplePerwakilanId ?? this.samplePerwakilanId,
    woNo: woNo ?? this.woNo,
    woTanggal: woTanggal ?? this.woTanggal,
    perusahaanNama: perusahaanNama ?? this.perusahaanNama,
    namaCp: namaCp ?? this.namaCp,
    telpCp: telpCp ?? this.telpCp,
    lokasi: lokasi ?? this.lokasi,
    samplePerwakilanKode: samplePerwakilanKode ?? this.samplePerwakilanKode,
    tanggalRencana: tanggalRencana ?? this.tanggalRencana,
    tanggalRencanaSampai: tanggalRencanaSampai ?? this.tanggalRencanaSampai,
    jenisPengukuran: jenisPengukuran ?? this.jenisPengukuran,
    ketua: ketua ?? this.ketua,
    catatanApproval: catatanApproval ?? this.catatanApproval,
    status: status ?? this.status,
    peralatan: peralatan ?? this.peralatan,
    blanko: blanko ?? this.blanko,
    anggota: anggota ?? this.anggota,
    sample: sample ?? this.sample,
    parameterpengujian: parameterpengujian ?? this.parameterpengujian,
    parameterpendukung: parameterpendukung ?? this.parameterpendukung,
    list: list ?? this.list
  );

  factory WoDetailModel.fromMap(Map<String, dynamic> m) => WoDetailModel(
    id: m['id'] ?? 0,
    isSampleReceived: m['is_sample_received'] ?? 0,
    samplePerwakilanId: m['sample_perwakilan_id'] ?? 0,
    woNo: m['wo_no'] ?? '',
    woTanggal: m['wo_tanggal'] ?? '',
    perusahaanNama: m['perusahaan_nama'] ?? '',
    namaCp: m['nama_cp'] ?? '',
    telpCp: m['telp_cp'] ?? '',
    lokasi: m['lokasi'] ?? '',
    samplePerwakilanKode: m['sample_perwakilan_kode'] ?? '',
    tanggalRencana: m['tanggal_rencana'] ?? '',
    tanggalRencanaSampai: m['tanggal_rencana_sampai'] ?? '',
    jenisPengukuran: m['jenis_pengukuran'] ?? '',
    ketua: m['ketua'] ?? '',
    catatanApproval: m['catatan_approval'] ?? '',
    status: m['status'] != null ? WoStatusModel.fromMap(m['status']) : null,
    peralatan: m['peralatan'] != null ? WoToolModel.fromList(m['peralatan']).list : [],
    blanko: m['blanko'] != null ? WoPaperModel.fromList(m['blanko']).list : [],
    anggota: m['anggota'] != null ? WoMemberModel.fromList(m['anggota']).list : [],
    parameterpengujian: m['parameterpengujian'] != null ? WoTestParameterModel.fromList(m['parameterpengujian']).list : [],
    parameterpendukung: m['parameterpendukung'] != null ? WoSupportParameterModel.fromList(m['parameterpendukung']).list : [],
    sample: m['sample'] != null ? WoSampleModel.fromList(m['sample']).list : [],
   );

  factory WoDetailModel.fromString(String s) => WoDetailModel.fromMap(jsonDecode(s));

  static Map<String, dynamic> toDetail(String no) => {
    'wo_no': no
  };
}
