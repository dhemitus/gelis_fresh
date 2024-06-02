import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gelis/domain/domain.dart';
import 'package:gelis/modules/modules.dart';

class PrintRepository {

  Future<PrintWo> preview(PrintModel print) async {
    try {
      PrintService pdf = PrintService(
        wo: print.toData(),
        member: print.toMember(),
        support: print.toSupport(),
        sampling: print.toSampling(),
        test: print.toTest(),
        plate: print.toPlate()
      );
      Future<Uint8List> bytes = pdf.create();

      return PrintWo(status: PrintStatus.success, print: PrintModel(bytes: bytes));
     
    } catch (e) {
      throw const PrintException(PrintWo(status: PrintStatus.failure));
    }
  }

  Future<PrintWo> loadWoDetail({String no = ''}) async {
    try {
      Uri uri = Uri.https(Network.domain, Network.wodetail, WoDetailModel.toDetail(no));
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);
      print('------------------- wo detail');
print(uri);
      final http.Response response = await http.get(
        uri,
        headers: Network.tokenHeader('Bearer ${token.token}')
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        print(data);
        WoDetailModel detail = WoDetailModel.fromMap(data['data']);

        PrintModel m = PrintModel(wo: detail);
        PrintWo d = await preview(m);
 
        d = d.copyWith(detail: detail, status: PrintStatus.success);
        return d;
      } else {
        throw const PrintException(PrintWo(status: PrintStatus.failure));
      }
    } catch(_) {
      throw const PrintException(PrintWo(status: PrintStatus.failure));
    }    
  }

}
