import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class WoSampleModel extends Equatable {
  final int? id,
    //biayaTambahan,
    //biayaTambahanNominal,
    //jumlahWadah,
    //jumlahHari,
    //totalHarga,
    jenisPengukuranGroupId,
    //samplingBiaya,
    //samplingMetodeId,
    samplingWoId,
    samplingWoIsdone,
    hasilPendukungPetugasId,
    jenisPengukuranId,
    peraturanId,
    bakumutuId;
  //final WoQuotationModel? quotation;
  final String? kodeSample,
    tanggalPenerimaan,
    tanggalPengambilanSample,
    lokasi,
    alamatLokasi,
    tanggalEstimasiSelesai,
    latitudeLongitude,
    kodeSamplePelanggan,
    jenisPengukuran,
    peraturan,
    bakumutu,
    //percepatan,
    catatan,
    perusahaanNama,
    namaCp,
    telpCp,
    //samplingTanggalPermintaan,
    samplingTujuan,
    samplingTujuanNama,
    samplingMetodeNama,
    hasilLatitudeLongitude,
    hasilFoto,
    //hasilPendukungWaktuSampling,
    //hasilPendukungWaktuKirim,
    hasilPendukungPetugasNama,
    hasilLokasi,
    //hasilKeterangan,
    hasilAbnormalitas,
    jenisPengukuranGroup;
  final List<WoTestParameterModel>? bakumutuParamuji;
  final List<WoSupportParameterModel>? bakumutuParampendukung;
  final List<WoSampleModel>? list;
  
  const WoSampleModel({
    this.id,
    //this.biayaTambahan,
    //this.biayaTambahanNominal,
    //this.jumlahWadah,
    //this.jumlahHari,
    //this.totalHarga,
    this.jenisPengukuranGroupId,
    //this.samplingBiaya,
    //this.samplingMetodeId,
    this.samplingWoId,
    this.samplingWoIsdone,
    this.hasilPendukungPetugasId,
    this.jenisPengukuranId,
    this.peraturanId,
    this.bakumutuId,
    //this.quotation,
    this.kodeSample,
    this.tanggalPenerimaan,
    this.tanggalPengambilanSample,
    this.lokasi,
    this.alamatLokasi,
    this.tanggalEstimasiSelesai,
    this.latitudeLongitude,
    this.kodeSamplePelanggan,
    this.jenisPengukuran,
    this.peraturan,
    this.bakumutu,
    //this.percepatan,
    this.catatan,
    this.perusahaanNama,
    this.namaCp,
    this.telpCp,
    //this.samplingTanggalPermintaan,
    this.samplingTujuan,
    this.samplingTujuanNama,
    this.samplingMetodeNama,
    this.hasilLatitudeLongitude,
    this.hasilFoto,
    //this.hasilPendukungWaktuSampling,
    //this.hasilPendukungWaktuKirim,
    this.hasilPendukungPetugasNama,
    this.hasilLokasi,
    //this.hasilKeterangan,
    this.hasilAbnormalitas,
    this.jenisPengukuranGroup,
    this.bakumutuParamuji,
    this.bakumutuParampendukung,
    this.list
  });

  @override
  List<Object?> get props => [
    id,
    //biayaTambahan,
    //biayaTambahanNominal,
    //jumlahWadah,
    //jumlahHari,
    //totalHarga,
    jenisPengukuranGroupId,
    //samplingBiaya,
    //samplingMetodeId,
    samplingWoId,
    samplingWoIsdone,
    hasilPendukungPetugasId,
    jenisPengukuranId,
    peraturanId,
    bakumutuId,
    //quotation,
    kodeSample,
    tanggalPenerimaan,
    tanggalPengambilanSample,
    lokasi,
    alamatLokasi,
    tanggalEstimasiSelesai,
    latitudeLongitude,
    kodeSamplePelanggan,
    jenisPengukuran,
    peraturan,
    bakumutu,
    //percepatan,
    catatan,
    perusahaanNama,
    namaCp,
    telpCp,
    //samplingTanggalPermintaan,
    samplingTujuan,
    samplingTujuanNama,
    samplingMetodeNama,
    hasilLatitudeLongitude,
    hasilFoto,
    //hasilPendukungWaktuSampling,
    //hasilPendukungWaktuKirim,
    hasilPendukungPetugasNama,
    hasilLokasi,
    //hasilKeterangan,
    hasilAbnormalitas,
    jenisPengukuranGroup,
    bakumutuParamuji,
    bakumutuParampendukung,
    list
  ];

  WoSampleModel copyWith({
    int? id,
    //biayaTambahan,
    //biayaTambahanNominal,
    //jumlahWadah,
    //jumlahHari,
    //totalHarga,
    jenisPengukuranGroupId,
    //samplingBiaya,
    //samplingMetodeId,
    samplingWoId,
    samplingWoIsdone,
    hasilPendukungPetugasId,
    jenisPengukuranId,
    peraturanId,
    bakumutuId,
    //WoQuotationModel? quotation,
    String? kodeSample,
    tanggalPenerimaan,
    tanggalPengambilanSample,
    lokasi,
    alamatLokasi,
    tanggalEstimasiSelesai,
    latitudeLongitude,
    kodeSamplePelanggan,
    jenisPengukuran,
    peraturan,
    bakumutu,
    //percepatan,
    catatan,
    perusahaanNama,
    namaCp,
    telpCp,
    //samplingTanggalPermintaan,
    samplingTujuan,
    samplingTujuanNama,
    samplingMetodeNama,
    hasilLatitudeLongitude,
    hasilFoto,
    //hasilPendukungWaktuSampling,
    //hasilPendukungWaktuKirim,
    hasilPendukungPetugasNama,
    hasilLokasi,
    //hasilKeterangan,
    hasilAbnormalitas,
    jenisPengukuranGroup,
    List<WoTestParameterModel>? bakumutuParamuji,
    List<WoSupportParameterModel>? bakumutuParampendukung,
    List<WoSampleModel>? list
  }) => WoSampleModel(
    id: id ?? this.id,
    //biayaTambahan: biayaTambahan ?? this.biayaTambahan,
    //biayaTambahanNominal: biayaTambahanNominal ?? this.biayaTambahanNominal,
    //jumlahWadah: jumlahWadah ?? this.jumlahWadah,
    //jumlahHari: jumlahHari ?? this.jumlahHari,
    //totalHarga: totalHarga ?? this.totalHarga,
    jenisPengukuranGroupId: jenisPengukuranGroupId ?? this.jenisPengukuranGroupId,
    //samplingBiaya: samplingBiaya ?? this.samplingBiaya,
    //samplingMetodeId: samplingMetodeId ?? this.samplingMetodeId,
    samplingWoId: samplingWoId ?? this.samplingWoId,
    samplingWoIsdone: samplingWoIsdone ?? this.samplingWoIsdone,
    hasilPendukungPetugasId: hasilPendukungPetugasId ?? this.hasilPendukungPetugasId,
    jenisPengukuranId: jenisPengukuranId ?? this.jenisPengukuranId,
    peraturanId: peraturanId ?? this.peraturanId,
    bakumutuId: bakumutuId ?? this.bakumutuId,
    //quotation: quotation ?? this.quotation,
    kodeSample: kodeSample ?? this.kodeSample,
    tanggalPenerimaan: tanggalPenerimaan ?? this.tanggalPenerimaan,
    tanggalPengambilanSample: tanggalPengambilanSample ?? this.tanggalPengambilanSample,
    lokasi: lokasi ?? this.lokasi,
    alamatLokasi: alamatLokasi ?? this.alamatLokasi,
    tanggalEstimasiSelesai: tanggalEstimasiSelesai ?? this.tanggalEstimasiSelesai,
    latitudeLongitude: latitudeLongitude ?? this.latitudeLongitude,
    kodeSamplePelanggan: kodeSamplePelanggan ?? this.kodeSamplePelanggan,
    jenisPengukuran: jenisPengukuran ?? this.jenisPengukuran,
    peraturan: peraturan ?? this.peraturan,
    bakumutu: bakumutu ?? this.bakumutu,
    //percepatan: percepatan ?? this.percepatan,
    catatan: catatan ?? this.catatan,
    perusahaanNama: perusahaanNama ?? this.perusahaanNama,
    namaCp: namaCp ?? this.namaCp,
    telpCp: telpCp ?? this.telpCp,
    //samplingTanggalPermintaan: samplingTanggalPermintaan ?? this.samplingTanggalPermintaan,
    samplingTujuan: samplingTujuan ?? this.samplingTujuan,
    samplingTujuanNama: samplingTujuanNama ?? this.samplingTujuanNama,
    samplingMetodeNama: samplingMetodeNama ?? this.samplingMetodeNama,
    hasilLatitudeLongitude: hasilLatitudeLongitude ?? this.hasilLatitudeLongitude,
    hasilFoto: hasilFoto ?? this.hasilFoto,
    //hasilPendukungWaktuSampling: hasilPendukungWaktuSampling ?? this.hasilPendukungWaktuSampling,
    //hasilPendukungWaktuKirim: hasilPendukungWaktuKirim ?? this.hasilPendukungWaktuKirim,
    hasilPendukungPetugasNama: hasilPendukungPetugasNama ?? this.hasilPendukungPetugasNama,
    hasilLokasi: hasilLokasi ?? this.hasilLokasi,
    //hasilKeterangan: hasilKeterangan ?? this.hasilKeterangan,
    hasilAbnormalitas: hasilAbnormalitas ?? this.hasilAbnormalitas,
    jenisPengukuranGroup: jenisPengukuranGroup ?? this.jenisPengukuranGroup,
    bakumutuParamuji: bakumutuParamuji ?? this.bakumutuParamuji,
    bakumutuParampendukung: bakumutuParampendukung ?? this.bakumutuParampendukung,
    list: list ?? this.list
  );

  factory WoSampleModel.fromMap(Map<String, dynamic> m) => WoSampleModel(
    id: m['id'] ?? 0,
    //biayaTambahan: m['biaya_tambahan'] ?? 0,
    //biayaTambahanNominal: m['biaya_tambahan_nominal'] ?? 0,
    //jumlahWadah: m['jumlah_wadah'] ?? 0,
    //jumlahHari: m['jumlah_hari'] ?? 0,
    //totalHarga: m['total_harga'] ?? 0,
    jenisPengukuranGroupId: m['jenis_pengukuran_group_id'] ?? 0,
    //samplingBiaya: m['sampling_biaya'] ?? 0,
    //samplingMetodeId: m['sampling_metode_id'] ?? 0,
    samplingWoId: m['samplingwo_id'] ?? 0,
    samplingWoIsdone: m['samplingwo_isdone'] ?? 0,
    hasilPendukungPetugasId: m['hasil_pendukung_petugas_id'] ?? 0,
    jenisPengukuranId: m['jenis_pengukuran_id'] ?? 0,
    peraturanId: m['peraturan_id'] ?? 0,
    bakumutuId: m['bakumutu_id'] ?? 0,
     //quotation: m['quotation_id'] != null ? WoQuotationModel.fromMap(m['quotation_id']) : null,
    kodeSample: m['kode_sample'] ?? '',
    tanggalPenerimaan: m['tanggal_penerimaan'] ?? '',
    tanggalPengambilanSample: m['tanggal_pengambilan_sample'] ?? '',
    lokasi: m['lokasi'] ?? '',
    alamatLokasi: m['alamat_lokasi'] ?? '',
    tanggalEstimasiSelesai: m['tanggal_estimasi_selesai'] ?? '',
    latitudeLongitude: m['latitude_longitude'] ?? '',
    kodeSamplePelanggan: m['kode_sample_pelanggan'] ?? '',
    jenisPengukuran: m['jenis_pengukuran'] ?? '',
    peraturan: m['peraturan'] ?? '',
    bakumutu: m['bakumutu'] ?? '',
     //percepatan: m['percepatan'] ?? '',
    catatan: m['catatan'] ?? '',
    perusahaanNama: m['perusahaan_nama'] ?? '',
    namaCp: m['nama_cp'] ?? '',
    telpCp: m['telp_cp'] ?? '',
    //samplingTanggalPermintaan: m['sampling_tanggal_permintaan'] ?? '',
    //samplingTujuan: m['sampling_tujuan'] ?? '',
    samplingTujuanNama: m['sampling_tujuan_nama'] ?? '',
    samplingMetodeNama: m['sampling_metode_nama'] ?? '',
    hasilLatitudeLongitude: m['hasil_latitude_longitude'] ?? '',
    hasilFoto: m['hasil_foto'] ?? '',
    //hasilPendukungWaktuSampling: m['hasil_pendukung_waktu_sampling'] ?? '',
    //hasilPendukungWaktuKirim: m['hasil_pendukung_waktu_kirim'] ??'',
    hasilPendukungPetugasNama: m['hasil_pendukung_petugas_nama'] ?? '',
    hasilLokasi: m['hasil_lokasi'] ?? '',
    //hasilKeterangan: m['hasil_keterangan'] ?? '',
    hasilAbnormalitas: m['hasil_abnormalitas'] ?? '',
    jenisPengukuranGroup: m['jenis_pengukuran_group'] ?? '',
    bakumutuParamuji: m['bakumutu_paramuji'] != null ? WoTestParameterModel.fromList(m['bakumutu_paramuji']).list : [],
    bakumutuParampendukung: m['bakumutu_parampendukung'] != null ? WoSupportParameterModel.fromList(m['bakumutu_parampendukung']).list : []
  ); 
  /*factory WoSampleModel.fromMap(Map<String, dynamic> m) => WoSampleModel(
    id: m['id'] ?? 0,
    //biayaTambahan: m['biaya_tambahan'] ?? 0,
    //biayaTambahanNominal: m['biaya_tambahan_nominal'] ?? 0,
    //jumlahWadah: m['jumlah_wadah'] ?? 0,
    //jumlahHari: m['jumlah_hari'] ?? 0,
    //totalHarga: m['total_harga'] ?? 0,
    jenisPengukuranGroupId: m['jenis_pengukuran_group_id'] ?? 0,
    //samplingBiaya: m['sampling_biaya'] ?? 0,
    //samplingMetodeId: m['sampling_metode_id'] ?? 0,
    samplingWoId: m['samplingwo_id'] ?? 0,
    samplingWoIsdone: m['samplingwo_isdone'] ?? 0,
    hasilPendukungPetugasId: m['hasil_pendukung_petugas_id'] ?? 0,
    jenisPengukuranId: m['jenis_pengukuran_id'] ?? 0,
    //peraturanId: m['peraturan_id'] ?? 0,
    bakumutuId: m['bakumutu_id'] ?? 0,
     //quotation: m['quotation_id'] != null ? WoQuotationModel.fromMap(m['quotation_id']) : null,
    kodeSample: m['kode_sample'] ?? '',
    tanggalPenerimaan: m['tanggal_penerimaan'] ?? '',
    tanggalPengambilanSample: m['tanggal_pengambilan_sample'] ?? '',
    lokasi: m['lokasi'] ?? '',
    alamatLokasi: m['alamat_lokasi'] ?? '',
    tanggalEstimasiSelesai: m['tanggal_estimasi_selesai'] ?? '',
    latitudeLongitude: m['latitude_longitude'] ?? '',
    kodeSamplePelanggan: m['kode_sample_pelanggan'] ?? '',
    jenisPengukuran: m['jenis_pengukuran'] ?? '',
    //peraturan: m['peraturan'] ?? '',
    bakumutu: m['bakumutu'] ?? '',
     //percepatan: m['percepatan'] ?? '',
    catatan: m['catatan'] ?? '',
    perusahaanNama: m['perusahaan_nama'] ?? '',
    namaCp: m['nama_cp'] ?? '',
    telpCp: m['telp_cp'] ?? '',
     //samplingTanggalPermintaan: m['sampling_tanggal_permintaan'] ?? '',
    //samplingTujuan: m['sampling_tujuan'] ?? '',
    samplingTujuanNama: m['sampling_tujuan_nama'] ?? '',
    samplingMetodeNama: m['sampling_metode_nama'] ?? '',
    hasilLatitudeLongitude: m['hasil_latitude_longitude'] ?? '',
    hasilFoto: m['hasil_foto'] ?? '',
    //hasilPendukungWaktuSampling: m['hasil_pendukung_waktu_sampling'] ?? '',
    //hasilPendukungWaktuKirim: m['hasil_pendukung_waktu_kirim'] ??'',
    hasilPendukungPetugasNama: m['hasil_pendukung_petugas_nama'] ?? '',
    hasilLokasi: m['hasil_lokasi'] ?? '',
    //hasilKeterangan: m['hasil_keterangan'] ?? '',
    hasilAbnormalitas: m['hasil_abnormalitas'] ?? '',
    jenisPengukuranGroup: m['jenis_pengukuran_group'] ?? '',
    bakumutuParamuji: m['bakumutu_paramuji'] != null ? WoTestParameterModel.fromList(m['bakumutu_paramuji']).list : [],
    bakumutuParampendukung: m['bakumutu_parampendukung'] != null ? WoSupportParameterModel.fromList(m['bakumutu_parampendukung']).list : []
  );*/

  factory WoSampleModel.fromList(List l) {
    List<WoSampleModel> list = [];
    l.map((a) => list.add(WoSampleModel.fromMap(a))).toList();
    return WoSampleModel(list: list);
  }

  factory WoSampleModel.fromString(String s) => WoSampleModel.fromMap(jsonDecode(s));

  static Map<String, dynamic> toDetail(int id) => {
    'samplepengujian': id.toString()
  };

}
