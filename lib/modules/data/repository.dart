import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';

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
    'status':'approve'
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
    'status':'checklist'
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
    'status':'ongoing'
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
    'status':'ongoing'
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
    'status':'approve'
  },
  {
    'id': '6',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'checklist'
  },
  {
    'id': '7',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'checklist'
  },
  {
    'id': '8',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'approve'
  },
  {
    'id': '9',
    'serial': 'WO.042022.00093',
    'title': 'Sampling Air Limbah',
    'company': 'PT.Agie Nawawi Indonesia',
    'calendar': '10 - 12 Januari 2022',
    'contact': 'Bulan Sutara',
    'location': 'Site A Sorowako',
    'locate': '3 Titik',
    'type': 'water',
    'status':'approve'
  },
];


class DataListRepository {
  final log = Logger();

  Future<DataListWo> loadWoList({String search = '', int limit = 0, int skip = 0}) async {
    log.d('open data list');
    try {
      Uri uri = Uri.https(Network.domain, Network.wolist, WoModel.toSearchOnly(search: search, limit: limit, skip: skip));
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);

      log.d(uri);
      final http.Response response = await http.get(
        uri,
        headers: Network.tokenHeader('Bearer ${token.token}')
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        log.d('cek data data');

        log.d(data);
        WoModel list = WoModel.fromList(data['data']);

        DataListWo wo = DataListWo(list: list.list, status: DataListStatus.success);
        return wo;
      } else {
        throw DatalistException(const DataListWo(status: DataListStatus.failure));
      }

    } catch(_) {
      throw DatalistException(const DataListWo(status: DataListStatus.failure));
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
