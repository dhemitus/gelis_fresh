import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class HistoryWo extends Equatable {
  final List<WoModel>? list;
  final HistoryListStatus? status;

  const HistoryWo({this.list, this.status});

  @override
  List<Object?> get props => [list, status];

  HistoryWo copyWith({
    List<WoModel>? list,
    HistoryListStatus? status
  }) => HistoryWo(
    list: list ?? this.list,
    status: status ?? this.status
  );
}
