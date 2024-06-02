part of './bloc.dart';

enum SupportStatus { loading, success, failure, detail }

class SupportState extends Equatable {
  final SupportStatus status;
  final WoMemberModel member;
  final String result, time;
  final WoSupportParameterModel detail;
  
  const SupportState({
    this.status = SupportStatus.loading,
    this.member = const WoMemberModel(),
    this.result = '',
    this.time = '',
    this.detail = const WoSupportParameterModel()
  });

  SupportState copyWith({
    SupportStatus? status,
    WoMemberModel? member,
    String? result, time,
    WoSupportParameterModel? detail
  }) => SupportState(
    status: status ?? this.status,
    member: member ?? this.member,
    result: result ?? this.result,
    time: time ?? this.time,
    detail: detail ?? this.detail
  );

  @override
  List<Object> get props => [status, member, result, time, detail];
}
