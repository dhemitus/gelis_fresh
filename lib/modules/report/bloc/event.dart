part of './bloc.dart';

abstract class ReportListEvent extends Equatable {
  const ReportListEvent();

  @override
  List<Object> get props => [];
}

class GetReportInitEvent extends ReportListEvent {}

class GetReportListEvent extends ReportListEvent {}

class GetReportSearchEvent extends ReportListEvent {
  final String search;
  const GetReportSearchEvent(this.search);
  
  @override
  List<Object> get props => [search];

}

class GetReportMetaEvent extends ReportListEvent {
  final WoMetaModel meta;
  const GetReportMetaEvent(this.meta);
  
  @override
  List<Object> get props => [meta];

}

class SetReportDetailEvent extends ReportListEvent {
  final WoModel wo;
  const SetReportDetailEvent(this.wo);

  @override
  List<Object> get props => [wo];
}
