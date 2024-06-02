import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class RevisedWo extends Equatable {
  final List<WoModel>? list;
  final RevisedListStatus? status;

  const RevisedWo({this.list, this.status});

  @override
  List<Object?> get props => [list, status];

  RevisedWo copyWith({
    List<WoModel>? list,
    RevisedListStatus? status
  }) => RevisedWo(
    list: list ?? this.list,
    status: status ?? this.status
  );
}
