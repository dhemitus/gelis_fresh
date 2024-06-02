part of './bloc.dart';

abstract class SupportEvent extends Equatable {
  const SupportEvent();

  @override
  List<Object> get props => [];
}

class SetSupportEvent extends SupportEvent {
  final SupportModel support;

  const SetSupportEvent(this.support);

  @override
  List<Object> get props => [support];
}

class SetSupportMemberEvent extends SupportEvent {
  final WoMemberModel member;

  const SetSupportMemberEvent(this.member);

  @override
  List<Object> get props => [member];
}

class SetSupportResultEvent extends SupportEvent {
  final String result;

  const SetSupportResultEvent(this.result);

  @override
  List<Object> get props => [result];
}

class SetSupportTimeEvent extends SupportEvent {
  final String time;

  const SetSupportTimeEvent(this.time);

  @override
  List<Object> get props => [time];
}

class SetSupportDetailEvent extends SupportEvent {
  final WoSupportParameterModel detail;

  const SetSupportDetailEvent(this.detail);

  @override
  List<Object> get props => [detail];
}
