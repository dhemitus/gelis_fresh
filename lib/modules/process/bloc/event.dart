part of './bloc.dart';

abstract class ProcessEvent extends Equatable {
  const ProcessEvent();

  @override
  List<Object> get props => [];
}

class SetProcessEvent extends ProcessEvent {
  final ProcessModel process;
  const SetProcessEvent(this.process);

  @override
  List<Object> get props => [process];
}

class SetProcessNoteEvent extends ProcessEvent {
  final String note;
  const SetProcessNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class SetProcessMemberEvent extends ProcessEvent {
  final WoMemberModel member;
  
  const SetProcessMemberEvent(this.member);

  @override
  List<Object> get props => [member];
}

class SetProcessPlateEvent extends ProcessEvent {
  final String plate;

  const SetProcessPlateEvent(this.plate);

  @override
  List<Object> get props => [plate];
}

class SetProcessResultEvent extends ProcessEvent {
  final String result;

  const SetProcessResultEvent(this.result);

  @override
  List<Object> get props => [result];
}

class SetProcessDoneEvent extends ProcessEvent {
  final bool done;

  const SetProcessDoneEvent(this.done);

  @override
  List<Object> get props => [done];
}
