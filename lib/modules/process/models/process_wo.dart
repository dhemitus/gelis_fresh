import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class ProcessWo extends Equatable {
  final ProcessModel? process;
  final ProcessStatus? status;

  const ProcessWo({this.status, this.process});

  @override
  List<Object?> get props => [status, process];

  ProcessWo copyWith({
    ProcessModel? process,
    ProcessStatus? status,
  }) => ProcessWo(
    status: status ?? this.status,
    process: process ?? this.process
  );
}
