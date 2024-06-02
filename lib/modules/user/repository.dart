import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gelis/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

class UserRepository {
  User? user;
  Logger log = Logger();

  Future<User> getUser() async {
    try {
      Uri uri = Uri.https(Network.domain, Network.profile);
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final TokenModel token = TokenModel.fromString(storage.getString('token')!);

      final http.Response response = await http.get(
        uri,
        headers: Network.tokenHeader('Bearer ${token.token}')
      );

      print(response.body);
      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        User user = User.fromMap(data['data']);
        //user = user.copyWith(image: 'https://i.pravatar.cc/300');
        storage.setString('user', user.toString());
        
        user = user.copyWith(status: UserStatus.success);
        return user;
      } else {
        throw UserException(const User(status: UserStatus.failure));
      }

    } catch (_) {
      throw UserException(const User(status: UserStatus.failure));
    }
  }

  Future<void> delUser() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.remove('user');
  }
}
