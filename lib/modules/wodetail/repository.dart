import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

List<Map<String, dynamic>> _wosd = [
  {
    'id': '1',
    'serial': '0045.83',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'location': 'Pabrik A',
    'contact': 'Metode pengambilan contoh uji air untuk pengujian fisika dan kimia',
    'locate': 'Baku mutu',
    'type': 'water',
    'sni': 'SNI 22.2018',
    'target': 'Pemantauan',
    'check': 'Lampiran II/Baku Mutu Industri Minyak Sawit'
  },
  {
    'id': '2',
    'serial': '0045.84',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'location': 'Pabrik A',
    'contact': 'Metode pengambilan contoh uji air untuk pengujian fisika dan kimia',
    'locate': 'Baku mutu',
    'type': 'water',
    'sni': 'SNI 22.2018',
    'target': 'Pemantauan',
    'check': 'Lampiran II/Baku Mutu Industri Minyak Sawit'
  },
  {
    'id': '3',
    'serial': '0045.85',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'location': 'Pabrik A',
    'contact': 'Metode pengambilan contoh uji air untuk pengujian fisika dan kimia',
    'locate': 'Baku mutu',
    'type': 'water',
    'sni': 'SNI 22.2018',
    'target': 'Pemantauan',
    'check': 'Lampiran II/Baku Mutu Industri Minyak Sawit'
  },
];

class WoDetailRepository {
  List<WoDetailItem>? _l;
  Future<List<WoDetailItem>> loadWoDetailList() async {
    return Future.delayed(
        const Duration(milliseconds: 300),
            () {
          _l = [];
          _wosd.map((Map<String, dynamic> e) => _l!.add(WoDetailItem.fromMap(e))).toList();
          return _l!;
        }
    );
  }

  Future<WoDetail> loadWoDetail({String no = ''}) async {
    try {
      Uri uri = Uri.https(Network.domain, Network.wodetail, WoDetailModel.toDetail(no));
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);

      final http.Response response = await http.get(
        uri,
        headers: Network.tokenHeader('Bearer ${token.token}')
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        WoDetailModel detail = WoDetailModel.fromMap(data['data']);

        WoDetail wo = WoDetail(detail: detail, status: WoDetailStatus.success);
        return wo;
      } else {
        throw WoDetailException(const WoDetail(status: WoDetailStatus.failure));
      }
    } catch(_) {
      throw WoDetailException(const WoDetail(status: WoDetailStatus.failure));
    }    
  }
}
