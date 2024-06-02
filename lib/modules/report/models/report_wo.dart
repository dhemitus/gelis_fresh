import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class ReportWo extends Equatable {
  final List<WoModel>? list;
  final ReportListStatus? status;

  const ReportWo({this.list, this.status});

  @override
  List<Object?> get props => [list, status];

  ReportWo copyWith({
    List<WoModel>? list,
    ReportListStatus? status
  }) => ReportWo(
    list: list ?? this.list,
    status: status ?? this.status
  );
}
