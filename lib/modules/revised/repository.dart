import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';


class RevisedListRepository {
  Logger log = Logger();

  Future<RevisedWo> loadWoList({String search = '', int limit = 0, int skip = 0}) async {
    try {
      Uri uri = Uri.https(Network.domain, Network.wolist, WoModel.toSearch(7, search: search, limit: limit, skip: skip));
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
        RevisedWo wo = RevisedWo(list: list.list, status: RevisedListStatus.success);
        return wo;
      } else {
        throw RevisedException(const RevisedWo(status: RevisedListStatus.failure));
      }      
    } catch (_) {
      throw RevisedException(const RevisedWo(status: RevisedListStatus.failure));
    }
  }
}
