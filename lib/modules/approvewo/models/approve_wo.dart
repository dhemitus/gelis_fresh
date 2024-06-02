import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class ApproveWo extends Equatable {
  final List<WoModel>? list;
  final WoMetaModel? meta;
  final ApproveWoListStatus? status;

  const ApproveWo({this.list, this.meta, this.status});

  @override
  List<Object?> get props => [list, meta, status];

  ApproveWo copyWith({
    List<WoModel>? list,
    WoMetaModel? meta,
    ApproveWoListStatus? status
  }) => ApproveWo(
    list: list ?? this.list,
    meta: meta ?? this.meta,
    status: status ?? this.status
  );
}
