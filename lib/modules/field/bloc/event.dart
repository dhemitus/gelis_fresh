part of './bloc.dart';

abstract class FieldEvent extends Equatable {
  const FieldEvent();

  @override
  List<Object> get props => [];
}

class SetFieldEvent extends FieldEvent {
  final FieldModel field;

  const SetFieldEvent(this.field);

  @override
  List<Object> get props => [field];
}

class SetFieldFirstEvent extends FieldEvent {
  final String first;

  const SetFieldFirstEvent(this.first);

  @override
  List<Object> get props => [first];
}

class SetFieldLastEvent extends FieldEvent {
  final String last;

  const SetFieldLastEvent(this.last);

  @override
  List<Object> get props => [last];
}

class SetFieldTestEvent extends FieldEvent {
  final String test;

  const SetFieldTestEvent(this.test);

  @override
  List<Object> get props => [test];
}

class SetFieldSimploEvent extends FieldEvent {
  final String simplo;

  const SetFieldSimploEvent(this.simplo);

  @override
  List<Object> get props => [simplo];
}

class SetFieldDuploEvent extends FieldEvent {
  final String duplo;

  const SetFieldDuploEvent(this.duplo);

  @override
  List<Object> get props => [duplo];
}

class SetFieldFlatEvent extends FieldEvent {
  final String flat;

  const SetFieldFlatEvent(this.flat);

  @override
  List<Object> get props => [flat];
}

class SetFieldRdpEvent extends FieldEvent {
  final String rdp;

  const SetFieldRdpEvent(this.rdp);

  @override
  List<Object> get props => [rdp];
}

class SetFieldNoteEvent extends FieldEvent {
  final String note;

  const SetFieldNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class SetFieldActualEvent extends FieldEvent {
  final String actual;

  const SetFieldActualEvent(this.actual);

  @override
  List<Object> get props => [actual];
}

class SetFieldVerifyEvent extends FieldEvent {
  final String verify;

  const SetFieldVerifyEvent(this.verify);

  @override
  List<Object> get props => [verify];
}

class SetFieldRangeEvent extends FieldEvent {
  final int range;

  const SetFieldRangeEvent(this.range);

  @override
  List<Object> get props => [range];
}

class SetFieldQualityEvent extends FieldEvent {
  final int quality;

  const SetFieldQualityEvent(this.quality);

  @override
  List<Object> get props => [quality];
}

class SetFieldQuantityEvent extends FieldEvent {
  final int quantity;

  const SetFieldQuantityEvent(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class SetFieldFlowEvent extends FieldEvent {
  final int flow;

  const SetFieldFlowEvent(this.flow);

  @override
  List<Object> get props => [flow];
}

class SetFieldMemberEvent extends FieldEvent {
  final WoMemberModel member;

  const SetFieldMemberEvent(this.member);

  @override
  List<Object> get props => [member];
}

class SetFieldDetailEvent extends FieldEvent {
  final WoTestParameterModel detail;

  const SetFieldDetailEvent(this.detail);

  @override
  List<Object> get props => [detail];
}
