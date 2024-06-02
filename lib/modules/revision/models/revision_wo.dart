import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class RevisionWo extends Equatable {
  final List<WoModel>? list;
  final RevisionListStatus? status;

  const RevisionWo({this.list, this.status});

  @override
  List<Object?> get props => [list, status];

  RevisionWo copyWith({
    List<WoModel>? list,
    RevisionListStatus? status
  }) => RevisionWo(
    list: list ?? this.list,
    status: status ?? this.status
  );
}
