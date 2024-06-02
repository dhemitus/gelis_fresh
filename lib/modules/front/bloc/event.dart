part of './bloc.dart';

abstract class FrontListEvent extends Equatable {
  const FrontListEvent();

  @override
  List<Object> get props => [];
}

class GetFrontListEvent extends FrontListEvent {}

class GetFrontDateEvent extends FrontListEvent {
  final String date;
  const GetFrontDateEvent(this.date);
  
  @override
  List<Object> get props => [date];
}

class SetFrontDetailEvent extends FrontListEvent {
  final WoModel wo;
  const SetFrontDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}

