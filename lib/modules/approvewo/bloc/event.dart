part of './bloc.dart';

abstract class ApproveWoListEvent extends Equatable {
  const ApproveWoListEvent();

  @override
  List<Object> get props => [];
}

class GetApproveWoInitEvent extends ApproveWoListEvent {}

class GetApproveWoListEvent extends ApproveWoListEvent {}

class GetApproveWoSearchEvent extends ApproveWoListEvent {
  final String search;
  const GetApproveWoSearchEvent(this.search);
  
  @override
  List<Object> get props => [search];
}

class GetApproveWoMetaEvent extends ApproveWoListEvent {
  final WoMetaModel meta;
  const GetApproveWoMetaEvent(this.meta);
  
  @override
  List<Object> get props => [meta];
}

class SetApproveWoDetailEvent extends ApproveWoListEvent {
  final WoModel wo;
  const SetApproveWoDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
