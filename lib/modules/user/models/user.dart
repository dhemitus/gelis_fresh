import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class User extends Equatable {
  final int? id, active;
  final String? username, email, fullname, image, jenisDataId;
  final List? role;
  final UserStatus? status;

  const User({this.id, this.active, this.username, this.email, this.fullname, this.image, this.jenisDataId, this.role = const [], this.status});

  @override
  List<Object?> get props => [id, active, username, email, fullname, image, jenisDataId, role, status];

  static const empty = User();
  
  User copyWith({
    int? id, active, 
    String? username, email, fullname, image, jenisDataId,
    List? role,
    UserStatus? status
  }) => User(
    id: id ?? this.id,
    active: active ?? this.active,
    username: username ?? this.username,
    email: email ?? this.email,
    fullname: fullname ?? this.fullname,
    image: image ?? this.image,
    jenisDataId: jenisDataId ?? this.jenisDataId,
    role: role ?? this.role,
    status: status ?? this.status
  );

  factory User.fromMap(Map<String, dynamic> m) => User(
    id: m['id'] ?? 0,
    username: m['username'] ?? '',
    email: m['email'] ?? '',
    fullname: m['fullname'] ?? '',
    image: m['image'] ?? '',
    jenisDataId: m['jenis_data_id'] ?? '',
    role: m['role'] ?? []
  );

  factory User.fromString(String s) => User.fromMap(jsonDecode(s));

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'email': email,
    'fullname': fullname,
    'image': image,
    'jenis_data_id': jenisDataId,
    'role': role
  };

  @override
  String toString() => jsonEncode(toMap());

}
