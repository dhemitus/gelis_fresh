part of './bloc.dart';

abstract class RevisedListEvent extends Equatable {
  const RevisedListEvent();

  @override
  List<Object> get props => [];
}

class GetRevisedInitEvent extends RevisedListEvent {}

class GetRevisedListEvent extends RevisedListEvent {}

class GetRevisedSearchEvent extends RevisedListEvent {
  final String search;
  const GetRevisedSearchEvent(this.search);
  
  @override
  List<Object> get props => [search];
}

class GetRevisedMetaEvent extends RevisedListEvent {
  final WoMetaModel meta;
  const GetRevisedMetaEvent(this.meta);
  
  @override
  List<Object> get props => [meta];

}

class SetRevisedDetailEvent extends RevisedListEvent {
  final WoModel wo;
  const SetRevisedDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
