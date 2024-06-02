import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:gelis/modules/modules.dart';

class ImageRepository {
  Future<ImageWo> sendImage(ImageModel m) async {
    try {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);
      final http.Response response = await http.post(
        Uri.parse(Network.foto),
        headers: Network.tokenHeader('Bearer ${token.token}'),
        body: m.toPost()
      );

      if (response.statusCode == 200) {
        debugPrint(response.body);
        return const ImageWo(image: null, status: ImageStatus.success);
      } else {
        throw ImageException(const ImageWo(status: ImageStatus.failure));
      }
    } catch (e) {
      throw ImageException(const ImageWo(status: ImageStatus.failure));
    }
  }
}
