part of './bloc.dart';

abstract class OnGoingListEvent extends Equatable {
  const OnGoingListEvent();

  @override
  List<Object> get props => [];
}

class GetOnGoingInitEvent extends OnGoingListEvent {}

class GetOnGoingListEvent extends OnGoingListEvent {}

class GetOnGoingSearchEvent extends OnGoingListEvent {
  final String search;
  const GetOnGoingSearchEvent(this.search);
  
  @override
  List<Object> get props => [search];

}

class GetOnGoingMetaEvent extends OnGoingListEvent {
  final WoMetaModel meta;
  const GetOnGoingMetaEvent(this.meta);
  
  @override
  List<Object> get props => [meta];

}

class SetOnGoingDetailEvent extends OnGoingListEvent {
  final WoModel wo;
  const SetOnGoingDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
