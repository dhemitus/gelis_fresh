import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';


class FieldRepository {
  Future<FieldWo> sendfield(FieldModel f) async {
    try {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);
      String url = '${Network.paramtest}/${f.toId()}';
      final http.Response response = await http.patch(
        Uri.parse(url),
        headers: Network.tokenHeader('Bearer ${token.token}'),
        body: f.toPost()
      );
      print(response.body);
      if (response.statusCode == 200) {
        return const FieldWo(status: FieldStatus.success);
      } else {
        throw const FieldException(FieldWo(status: FieldStatus.failure));
      }
    } catch (e) {
      throw const FieldException(FieldWo(status: FieldStatus.failure));
    }
  }
}
