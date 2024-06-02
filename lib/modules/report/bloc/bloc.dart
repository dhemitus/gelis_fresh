import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class ReportListBloc extends Bloc<ReportListEvent, ReportListState> {
  final ReportListRepository _reportListRepository;

  ReportListBloc(ReportListRepository reportListRepository) : _reportListRepository = reportListRepository, super(const ReportListState()) {
    on<GetReportInitEvent>(_onInit);
    on<GetReportListEvent>(_onLoad);
    on<GetReportMetaEvent>(_onMeta);
    on<GetReportSearchEvent>(_onSearch);
    on<SetReportDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetReportListEvent event, Emitter<ReportListState> emit) async {
    try {
      emit(state.copyWith(status: ReportListStatus.loading));
      ReportWo l = await _reportListRepository.loadWoList(
        search: state.search,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, status: l.status));
    } catch(_) {
      emit(state.copyWith(status: ReportListStatus.failure));
    }
  }

  void _onInit(GetReportInitEvent event, Emitter<ReportListState> emit) {
    emit(const ReportListState());
  }

  void _onSearch(GetReportSearchEvent event, Emitter<ReportListState> emit) {
    emit(state.copyWith(search: event.search));
  }

  void _onMeta(GetReportMetaEvent event, Emitter<ReportListState> emit) {
    emit(state.copyWith(meta: event.meta));
  }

  void _onDetail(SetReportDetailEvent event, Emitter<ReportListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
