part of './bloc.dart';

abstract class CrumbEvent extends Equatable {
  const CrumbEvent();

  @override
  List<Object> get props => [];
}

class GetCrumbEvent extends CrumbEvent {}

class SetCrumbEvent extends CrumbEvent {
  final CrumbItem crum;
  const SetCrumbEvent(this.crum);

  @override
  List<Object> get props => [crum];
}
