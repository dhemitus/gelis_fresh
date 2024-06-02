import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';

class CheckListRepository {
  final log = Logger();

  Future<ChecklistWo> loadWoList({String search = '', int limit = 0, int skip = 0}) async {
    try {
      Uri uri = Uri.https(Network.domain, Network.wolist, WoModel.toSearch(4, search: search, limit: limit, skip: skip));
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);

      final http.Response response = await http.get(
        uri,
        headers: Network.tokenHeader('Bearer ${token.token}')
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        log.d(data);
        WoModel list = WoModel.fromList(data['data']);

        ChecklistWo wo = ChecklistWo(list: list.list, status: CheckListStatus.success);
        return wo;
      } else {
        throw ChecklistException(const ChecklistWo(status: CheckListStatus.failure));
      }

    } catch(_) {
      throw ChecklistException(const ChecklistWo(status: CheckListStatus.failure));
    }
  }
}
