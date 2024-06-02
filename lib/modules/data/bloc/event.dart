part of './bloc.dart';

abstract class DataListEvent extends Equatable {
  const DataListEvent();

  @override
  List<Object> get props => [];
}

class GetDataInitEvent extends DataListEvent {}

class GetDataListEvent extends DataListEvent {}

class GetDataSearchEvent extends DataListEvent {
  final String search;
  const GetDataSearchEvent(this.search);
  
  @override
  List<Object> get props => [search];
}

class GetDataMetaEvent extends DataListEvent {
  final WoMetaModel meta;
  const GetDataMetaEvent(this.meta);
  
  @override
  List<Object> get props => [meta];
}

class SetDataDetailEvent extends DataListEvent {
  final WoModel wo;
  const SetDataDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
