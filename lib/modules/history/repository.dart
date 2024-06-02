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
    'type': 'water',
    'picture': 'https://picsum.photos/id/10/300/300',
    'status': 'selesai',
    'date': '8 Agustus 2023'
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
    'type': 'air',
    'picture': 'https://picsum.photos/id/11/300/300',
    'status': 'selesai',
    'date': '8 Agustus 2023'
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
    'type': 'water',
    'picture': 'https://picsum.photos/id/12/300/300',
    'status': 'dibatalkan',
    'date': '8 Agustus 2023'
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
    'type': 'air',
    'picture': 'https://picsum.photos/id/13/300/300',
    'status': 'selesai',
    'date': '8 Agustus 2023'
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
    'type': 'water',
    'picture': 'https://picsum.photos/id/14/300/300',
    'status': 'selesai',
    'date': '8 Agustus 2023'
  },
];


class HistoryListRepository {
  Logger log = Logger();

  Future<HistoryWo> loadWoList({String search = '', int limit = 0, int skip = 0}) async {
    try {
      Uri uri = Uri.https(Network.domain, Network.wolist, WoModel.toSearch(9, search: search, limit: limit, skip: skip));
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
        log.d(list);
        HistoryWo wo = HistoryWo(list: list.list, status: HistoryListStatus.success);
        return wo;
      } else {
        throw HistoryException(const HistoryWo(status: HistoryListStatus.failure));
      }      
    } catch (_) {
      throw HistoryException(const HistoryWo(status: HistoryListStatus.failure));
    }

    /*return Future.delayed(
      const Duration(milliseconds: 300),
        () {
          _l = [];
          _wos.map((Map<String, dynamic> e) => _l!.add(HistoryModel.fromMap(e))).toList();
          return _l!;
        }
    );*/
  }

}
