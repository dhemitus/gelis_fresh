import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class DataListWo extends Equatable {
  final List<WoModel>? list;
  final DataListStatus? status;

  const DataListWo({this.list, this.status});

  @override
  List<Object?> get props => [list, status];

  DataListWo copyWith({
    List<WoModel>? list,
    DataListStatus? status
  }) => DataListWo(
    list: list ?? this.list,
    status: status ?? this.status
  );
}
