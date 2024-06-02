part of './bloc.dart';

abstract class CheckListEvent extends Equatable {
  const CheckListEvent();

  @override
  List<Object> get props => [];
}

class GetCheckInitEvent extends CheckListEvent {}

class GetCheckListEvent extends CheckListEvent {}

class GetCheckSearchEvent extends CheckListEvent {
  final String search;
  const GetCheckSearchEvent(this.search);
  
  @override
  List<Object> get props => [search];
}

class GetCheckMetaEvent extends CheckListEvent {
  final WoMetaModel meta;
  const GetCheckMetaEvent(this.meta);
  
  @override
  List<Object> get props => [meta];
}

class SetCheckDetailEvent extends CheckListEvent {
  final WoModel wo;
  const SetCheckDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
