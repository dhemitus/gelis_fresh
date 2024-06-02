import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';

class ProcessRepository {

  Future<ProcessWo> sendProcess(ProcessModel p) async {
    try {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);
      String url = Network.plate;
      final http.Response response = await http.patch(
        Uri.parse(url),
        headers: Network.tokenHeader('Bearer ${token.token}'),
        body: p.toPost()
      );

      print(response.body);
      if(response.statusCode == 200) {
        return const ProcessWo(status: ProcessStatus.success);
      } else {
        throw ProcessException(const ProcessWo(status: ProcessStatus.failure));
      }

    } catch (e) {
      throw ProcessException(const ProcessWo(status: ProcessStatus.failure));
    }
  }
}
