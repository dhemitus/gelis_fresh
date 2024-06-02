import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gelis/modules/modules.dart';
import 'package:gelis/domain/network.dart';
import 'package:logger/logger.dart';

enum AuthenticationStatus {unknown, authenticated, unauthenticated}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  var log = Logger();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    try {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      final String token = storage.getString('token')!;

      if(token.isNotEmpty) {
        yield AuthenticationStatus.authenticated;
      } else {
        yield AuthenticationStatus.unauthenticated;
      }

    } catch(_) {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<bool> login({required AuthenticationModel auth}) async {
    try {
      final SharedPreferences storage = await SharedPreferences.getInstance();

      final http.Response response = await http.post(
        Uri.parse(Network.login),
        headers: Network.header,
        body: auth.toLogin()
      );

      if(response.statusCode == 200){
        storage.setString('token', TokenModel.fromString(response.body).toString());

        _controller.add(AuthenticationStatus.authenticated);
        return true;
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
        return false;
      }

    } catch(_){
      _controller.add(AuthenticationStatus.unauthenticated);
      return true;
    }
  }

  Future<void> logout() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.remove('token');
    _controller.add(AuthenticationStatus.unauthenticated);
  }
  void dispose() => _controller.close();
}
