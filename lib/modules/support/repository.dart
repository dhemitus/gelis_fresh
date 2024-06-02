import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';

class SupportRepository {
  Future<SupportWo> sendSupport(SupportModel s) async {
    try {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);
      String url = '${Network.paramsupport}/${s.toId()}';
      final http.Response response = await http.patch(
        Uri.parse(url),
        headers: Network.tokenHeader('Bearer ${token.token}'),
        body: s.toPost()
      );
      if (response.statusCode == 200) {
        return const SupportWo(status: SupportStatus.success);
      } else {
        throw SupporrException(const SupportWo(status: SupportStatus.failure));
      }

    } catch (e) {
      throw SupporrException(const SupportWo(status: SupportStatus.failure));
    }
  } 
}
