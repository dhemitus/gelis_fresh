import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

class ApproveWoListRepository {
  Logger log = Logger();

  Future<ApproveWo> loadWoList({String search = '', int limit = 0, int skip = 0}) async {
    try {
      log.d(WoModel.toSearch(2, search: search));
      Uri uri = Uri.https(Network.domain, Network.wolist, WoModel.toSearch(2, search: search, limit: limit, skip: skip));
      log.d(uri.toString());
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);

      final http.Response response = await http.get(
        uri,
        headers: Network.tokenHeader('Bearer ${token.token}')
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        WoModel list = WoModel.fromList(data['data']);

        ApproveWo wo = ApproveWo(list: list.list, status: ApproveWoListStatus.success);
        return wo;
      } else {
        throw ApprovedException(const ApproveWo(status: ApproveWoListStatus.failure));
      }
    } catch(_) {
      throw ApprovedException(const ApproveWo(status: ApproveWoListStatus.failure));
    }
  }

}
