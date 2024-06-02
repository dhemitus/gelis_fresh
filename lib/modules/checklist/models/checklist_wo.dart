import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class ChecklistWo extends Equatable {
  final List<WoModel>? list;
  final CheckListStatus? status;

  const ChecklistWo({this.list, this.status});

  @override
  List<Object?> get props => [list, status];

  ChecklistWo copyWith({
    List<WoModel>? list,
    CheckListStatus? status
  }) => ChecklistWo(
    list: list ?? this.list,
    status: status ?? this.status
  );
}
