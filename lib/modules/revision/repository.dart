import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

List<Map<String, dynamic>> _wos = [
  {
    'id': '1',
    'serial': 'WO.042022.00089',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water'
  },
  {
    'id': '2',
    'serial': 'WO.042022.00090',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'air'
  },
  {
    'id': '3',
    'serial': 'WO.042022.00091',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water'
  },
  {
    'id': '4',
    'serial': 'WO.042022.00092',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'air'
  },
  {
    'id': '5',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water'
  },
];

class RevisionListRepository {
  Logger log = Logger();

  Future<RevisionWo> loadWoList({String search = '', int limit = 0, int skip = 0}) async {
    try {
      Uri uri = Uri.https(Network.domain, Network.wolist, WoModel.toSearch(6, search: search, limit: limit, skip: skip));
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);

      final http.Response response = await http.get(
        uri,
        headers: Network.tokenHeader('Bearer ${token.token}')
      );

      log.d(response.statusCode);
      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        WoModel list = WoModel.fromList(data['data']);
        RevisionWo wo = RevisionWo(list: list.list, status: RevisionListStatus.success);
        return wo;
      } else {
        throw RevisionException(const RevisionWo(status: RevisionListStatus.failure));
      }      
    } catch (_) {
      throw RevisionException(const RevisionWo(status: RevisionListStatus.failure));
    }
    /*return Future.delayed(
      const Duration(milliseconds: 300),
        () {
          _l = [];
          _wos.map((Map<String, dynamic> e) => _l!.add(WoItem.fromMap(e))).toList();
          return _l!;
        }
    );*/
  }
}
