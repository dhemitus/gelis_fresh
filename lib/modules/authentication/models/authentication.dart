import 'dart:convert';
import 'package:equatable/equatable.dart';

class AuthenticationModel extends Equatable {
  final String? username, password;
  const AuthenticationModel({this.username, this.password});

  @override
  List<Object?> get props => [username, password];
 
  AuthenticationModel copyWith({
    String? username, password
  }) => AuthenticationModel(
    username: username ?? this.username,
    password: password ?? this.password
  );

  static const empty = AuthenticationModel();

  factory AuthenticationModel.fromMap(Map<String, dynamic> m) => AuthenticationModel(
    username: m['username'] ?? '',
    password: m['password'] ?? ''
  );

  factory AuthenticationModel.fromString(String s) => AuthenticationModel.fromMap(jsonDecode(s));

  Map<String, dynamic> toMap() => {
    'username': username,
    'password': password
  };

  String toLogin() => jsonEncode({
    'username': username,
    'password': password
  });

  @override
  String toString() => jsonEncode(toMap());

}
