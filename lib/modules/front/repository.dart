import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';

class FrontRepository {
  final log = Logger();

  Future<FrontWo> loadWoList({String date = '', int limit = 0, int skip = 0}) async {
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

        FrontWo wo = FrontWo(list: list.list, status: FrontListStatus.success);
        return wo;
      } else {
        throw FrontException(const FrontWo(status: FrontListStatus.failure));
      }

    } catch(_) {
      throw FrontException(const FrontWo(status: FrontListStatus.failure));
    }
  }
}
