import 'dart:convert';
import 'package:equatable/equatable.dart';

class WoMetaModel extends Equatable {
  final int? skip, limit, numrows;

  const WoMetaModel({this.skip, this.limit, this.numrows});

  @override
  List<Object?> get props => [skip, limit, numrows];

  WoMetaModel copyWith({
    int? skip, limit, numrows,
  }) => WoMetaModel(
    skip: skip ?? this.skip,
    limit: limit ?? this.limit,
    numrows: numrows ?? this.numrows
  );

  factory WoMetaModel.fromMap(Map<String, dynamic> m) => WoMetaModel(
    skip: m['skip'] ?? 0,
    limit: m['limit'] ?? 0,
    numrows: m['numrows'] ?? 0
  );

  factory WoMetaModel.fromString(String s) => WoMetaModel.fromMap(jsonDecode(s));
}
