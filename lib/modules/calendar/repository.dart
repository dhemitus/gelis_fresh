import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';

List<Map<String, dynamic>> _sch = [
  {
    'id': '1',
    'title': 'Tidak ada rencana  pengambilan sampling',
    'date': '6-12-2023',
    'schedule': [
      '6 - 12 Desember',
      '13 - 19 Desember'
    ],
  },
  {
    'id': '2',
    'title': '',
    'date': '15-12-2023',
    'schedule': [
      '16 - 22 Desember',
      '23 - 30 Desember'
    ],
    'wo': [
      {'label': 'WO.042022.00089', 'mark': 'ongoing'},
      {'label': 'WO.042022.00090', 'mark': 'checklist'}
    ]
  },
  {
    'id': '2',
    'title': '',
    'date': '27-12-2023',
    'wo': [
      {'label': 'WO.042022.00091', 'mark': 'approve'},
      {'label': 'WO.042022.00092', 'mark': 'ongoing'}
    ]
  }
];

class CalendarRepository {
  List<ScheduleItem>? l;
  final log = Logger();

  Future<CalendarWo> loadWoList({String date = '', int limit = 0, int skip = 0}) async {
    try {
      Uri uri = Uri.https(Network.domain, Network.wolist, WoModel.toDate(date, limit: limit, skip: skip));
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);

      log.d(uri.toString());
      final http.Response response = await http.get(
        uri,
        headers: Network.tokenHeader('Bearer ${token.token}')
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        log.d(data);
        WoModel list = WoModel.fromList(data['data']);

        CalendarWo wo = CalendarWo(list: list.list, status: CalendarStatus.success);
        return wo;
      } else {
        throw CalendarException(const CalendarWo(status: CalendarStatus.failure));
      }

    } catch(_) {
      throw CalendarException(const CalendarWo(status: CalendarStatus.failure));
    }
  }

  Future<List<ScheduleItem>> loadScheduleList() async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () {
        l = [];
        _sch.map((Map<String, dynamic> e) => l!.add(ScheduleItem.fromMap(e))).toList();
        return l!;
      }
    );
  }
}
