part of './bloc.dart';

abstract class WoListEvent extends Equatable {
  const WoListEvent();

  @override
  List<Object> get props => [];
}

class GetWoListEvent extends WoListEvent {}

class SetWoDetailEvent extends WoListEvent {
  final WoItem wo;
  const SetWoDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
