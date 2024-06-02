import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class PrintModel extends Equatable {
  final Future<Uint8List>? bytes;
  final WoDetailModel? wo;
  const PrintModel({this.bytes, this.wo});

  PrintModel copyWith({
    Future<Uint8List>? bytes,
    WoDetailModel? wo
  }) => PrintModel(
    bytes: bytes ?? this.bytes,
    wo: wo ?? this.wo
  );

  List<Map<String, String>> toData() {
    List<Map<String, String>> l = [];
    l.add({'title':'No Work Order', 'name': wo!.woNo ?? ''});
    l.add({'title':'Tanggal Work Order', 'name': TimeUtilities.toSlashDate(wo!.woTanggal!)});
    l.add({'title':'Nama Pelanggan', 'name': wo!.perusahaanNama ?? ''});
    l.add({'title':'Contact Person', 'name': wo!.namaCp ?? ''});
    l.add({'title':'No Telp Contact Person', 'name': wo!.telpCp ?? ''});
    l.add({'title':'Lokasi Sampling', 'name': wo!.lokasi ?? ''});
    l.add({'title':'Tanggal Rencana Sampling', 'name': '${TimeUtilities.toSlashDate(wo!.tanggalRencana!)} sd ${TimeUtilities.toSlashDate(wo!.tanggalRencanaSampai!)}'});
    return l;
  }

  List<Map<String, String>> toSampling() {
    List<Map<String, String>> l = [];
      l.add({
      'code': 'Kode Sampling',
      'name': 'Nama Perusahaan',
      'location': 'Lokasi Sampling',
      'method': 'Metode Sampling',
      'field': 'Bidang Pengujian',
      'purpose': 'Tujuan Sampling',
      'rule': 'Undang-undang',
      'quality': 'Baku Mutu'
    });

    wo!.sample!.map((e) {
      l.add({
        'code': e.kodeSample ?? '',
        'name': e.perusahaanNama ?? '',
        'location': e.lokasi ?? '',
        'method': e.samplingMetodeNama ?? '',
        'field': e.jenisPengukuran ?? '',
        'purpose': e.samplingTujuanNama ?? '',
        'rule': e.peraturan ?? '',
        'quality': e.bakumutu ?? ''
      });
    }).toList();
    return l;
  }


  List<Map<String, String>> toTest() {
    List<Map<String, String>> l = [];
      l.add({
      'check': 'Check',
      'code': 'Kode Sampling',
      'test': 'Parameter Uji',
      'handle': 'Penanganan Sample',
      'plate': 'Wadah',
      'treatment': 'Pengawetan',
      'volume': 'Volume Min',
      'limit': 'Batas Penyimpanan',
      'method': 'Cara Pengambilan'
    });

    wo!.parameterpengujian!.map((e) {
      l.add({
        'check': ' ',
        'code': wo!.sample!.firstWhere((s) => s.id == e.samplepengujianId).kodeSample ?? '',
        'test':  e.parameteruji ?? '',
        'handle': e.dataTaken ?? '',
        'plate': e.wadah ?? '',
        'treatment': e.pengawetan ?? '',
        'volume': e.volume ?? '',
        'limit': e.batasPenyimpanan ?? '',
        'method': e.caraPengambilan ?? ''
      });
    }).toList();
    return l;
  }

  List<Map<String, String>> toSupport() {
    List<Map<String, String>> l = [];
      l.add({
      'check': 'Check',
      'code': 'Kode Sample',
      'param': 'Parameter Pendukung',
      'sign': 'Satuan'
    });

    wo!.parameterpendukung!.map((e) {
      l.add({
        'check': ' ',
        'code':   wo!.sample!.firstWhere((s) => s.id == e.samplepengujianId).kodeSample ?? '',
        'param': e.parameterPendukung ?? '',
        'sign': e.satuan ?? ''
      });
    }).toList();

    return l;
  }

  List<Map<String, String>> toPlate() {
    List<Map<String, String>> l = [];
      l.add({
      'check': 'Check',
      'plate': 'Wadah',
      'volume': 'Volume',
      'label': 'Label'
    });

    wo!.blanko!.map((e) {
      l.add({
        'check': ' ',
        'plate': e.wadah ?? '',
        'volume': e.volume.toString(),
        'label': e.blankoLabel ?? ''
      });
    }).toList();

    return l;
  }

  List<Map<String, String>> toMember() {
    List<Map<String, String>> l = [];
    wo!.anggota!.map((e) => l.add({'title': e.jabatan ?? '', 'name': e.nama ?? ''})).toList();

    return l;
  }
  @override
  List<Object?> get props => [bytes, wo];
}
