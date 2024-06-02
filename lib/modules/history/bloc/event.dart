part of './bloc.dart';

abstract class HistoryListEvent extends Equatable {
  const HistoryListEvent();

  @override
  List<Object> get props => [];
}

class GetHistoryListEvent extends HistoryListEvent {}

class GetHistoryInitEvent extends HistoryListEvent {}

class GetHistorySearchEvent extends HistoryListEvent {
  final String search;
  const GetHistorySearchEvent(this.search);

  @override
  List<Object> get props => [search];
}

class GetHistoryMetaEvent extends HistoryListEvent {
  final WoMetaModel meta;
  const GetHistoryMetaEvent(this.meta);

  @override
  List<Object> get props => [meta];
}

class SetHistoryDetailEvent extends HistoryListEvent {
  final WoModel wo;
  const SetHistoryDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
