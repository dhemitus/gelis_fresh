import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class HistoryListBloc extends Bloc<HistoryListEvent, HistoryListState> {
  final HistoryListRepository _historyListRepository;

  HistoryListBloc(HistoryListRepository historyListRepository) : _historyListRepository = historyListRepository, super(const HistoryListState()) {
    on<GetHistoryInitEvent>(_onInit);
    on<GetHistoryListEvent>(_onLoad);
    on<GetHistoryMetaEvent>(_onMeta);
    on<GetHistorySearchEvent>(_onSearch);
    on<SetHistoryDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetHistoryListEvent event, Emitter<HistoryListState> emit) async {
    try {
      emit(state.copyWith(status: HistoryListStatus.loading));
      HistoryWo l = await _historyListRepository.loadWoList(
        search: state.search,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, status: l.status));
    } catch(_) {
      emit(state.copyWith(status: HistoryListStatus.failure));
    }
  }

  void _onInit(GetHistoryInitEvent event, Emitter<HistoryListState> emit) {
    emit(const HistoryListState());
  }

  void _onSearch(GetHistorySearchEvent event, Emitter<HistoryListState> emit) {
    emit(state.copyWith(search: event.search));
  }

  void _onMeta(GetHistoryMetaEvent event, Emitter<HistoryListState> emit) {
    emit(state.copyWith(meta: event.meta));
  }

  void _onDetail(SetHistoryDetailEvent event, Emitter<HistoryListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
