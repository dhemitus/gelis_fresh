part of './bloc.dart';

abstract class RevisionListEvent extends Equatable {
  const RevisionListEvent();

  @override
  List<Object> get props => [];
}

class GetRevisionInitEvent extends RevisionListEvent {}

class GetRevisionListEvent extends RevisionListEvent {}

class GetRevisionSearchEvent extends RevisionListEvent {
  final String search;
  const GetRevisionSearchEvent(this.search);
  
  @override
  List<Object> get props => [search];

}

class GetRevisionMetaEvent extends RevisionListEvent {
  final WoMetaModel meta;
  const GetRevisionMetaEvent(this.meta);
  
  @override
  List<Object> get props => [meta];

}

class SetRevisionDetailEvent extends RevisionListEvent {
  final WoModel wo;
  const SetRevisionDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
