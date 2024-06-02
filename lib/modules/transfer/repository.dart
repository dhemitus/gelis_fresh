import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';

class TransferRepository {
  
  Future<TransferWo> sendTransfer(WoModel p, int status) async {
    try {
      print('------------trans repo');
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);
      String url = Network.status;
      print(url);
      print(p.toTransfer(status));
      final http.Response response = await http.patch(
        Uri.parse(url),
        headers: Network.tokenHeader('Bearer ${token.token}'),
        body: p.toTransfer(status)
      );

      print(response.body);
      if(response.statusCode == 200) {
        return const TransferWo(status: TransferStatus.success);
      } else {
        throw TransferException(const TransferWo(status: TransferStatus.failure));
      }

    } catch (e) {
      throw TransferException(const TransferWo(status: TransferStatus.failure));
    }
  }

}
