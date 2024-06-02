import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

class SamplingRepository {
  Logger log = Logger();

  Future<SampleDetail> loadSample({int id = 0}) async {
    try {
      Uri uri = Uri.https(Network.domain, Network.wosample, WoSampleModel.toDetail(id));
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);
      final http.Response response = await http.get(
        uri,
        headers: Network.tokenHeader('Bearer ${token.token}')
      );
      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        WoSampleModel s = WoSampleModel.fromMap(data['data']);

        return SampleDetail(sample: s, status: SamplingStatus.success);
      } else {
        throw WoSampleException(const SampleDetail(status: SamplingStatus.failure));
      }
    } catch (e) {
        throw WoSampleException(const SampleDetail(status: SamplingStatus.failure));
    }
  }
}
