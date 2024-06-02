part of './bloc.dart';

enum ProcessStatus { loading, success, failure, detail }

class ProcessState extends Equatable {
  final ProcessStatus status;
  final WoMemberModel member;
  final String note, plate, result;
  final bool done;

  const ProcessState({
    this.status = ProcessStatus.loading,
    this.member = const WoMemberModel(),
    this.note = '',
    this.plate = '',
    this.result = '',
    this.done = false,
  });

  ProcessState copyWith({
    ProcessStatus? status,
    WoMemberModel? member,
    String? note, plate, result,
    bool? done,
  }) => ProcessState(
    status: status ?? this.status,
    member: member ?? this.member,
    note: note ?? this.note,
    plate: plate ?? this.plate,
    result: result ?? this.result,
    done: done ?? this.done
  );

  @override
  List<Object> get props => [status, member, note, plate, result, done];
}
