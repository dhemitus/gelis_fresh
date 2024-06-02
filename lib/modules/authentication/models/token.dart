import 'dart:convert';
import 'package:equatable/equatable.dart';

class TokenModel extends Equatable {
  final String? token, refreshToken;
  const TokenModel({this.token, this.refreshToken});

  @override
  List<Object?> get props => [token, refreshToken];
 
  TokenModel copyWith({
    String? token, refreshToken
  }) => TokenModel(
    token: token ?? this.token,
    refreshToken: refreshToken ?? this.refreshToken
  );

  static const empty = TokenModel();

  factory TokenModel.fromMap(Map<String, dynamic> m) => TokenModel(
    token: m['token'] ?? '',
    refreshToken: m['refreshToken'] ?? ''
  );

  factory TokenModel.fromString(String s) => TokenModel.fromMap(jsonDecode(s));

  Map<String, dynamic> toMap() => {
    'token': token,
    'refreshToken': refreshToken
  };

  String toLogin() => jsonEncode({
    'token': token,
    'refreshToken': refreshToken
  });

  @override
  String toString() => jsonEncode(toMap());

}
