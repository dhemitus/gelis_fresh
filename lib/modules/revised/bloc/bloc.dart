import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class RevisedListBloc extends Bloc<RevisedListEvent, RevisedListState> {
  final RevisedListRepository _revisedListRepository;

  RevisedListBloc(RevisedListRepository revisedListRepository) : _revisedListRepository = revisedListRepository, super(const RevisedListState()) {
    on<GetRevisedInitEvent>(_onInit);
    on<GetRevisedListEvent>(_onLoad);
    on<GetRevisedSearchEvent>(_onSearch);
    on<GetRevisedMetaEvent>(_onMeta);
    on<SetRevisedDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetRevisedListEvent event, Emitter<RevisedListState> emit) async {
    try {
      emit(state.copyWith(status: RevisedListStatus.loading));
      RevisedWo l = await _revisedListRepository.loadWoList(
        search: state.search,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, status: l.status));
    } catch(_) {
      emit(state.copyWith(status: RevisedListStatus.failure));
    }
  }

  void _onInit(GetRevisedInitEvent event, Emitter<RevisedListState> emit) {
    emit(const RevisedListState());
  }
  
  void _onSearch(GetRevisedSearchEvent event, Emitter<RevisedListState> emit) {
    emit(state.copyWith(search: event.search));
  }

  void _onMeta(GetRevisedMetaEvent event, Emitter<RevisedListState> emit) {
    emit(state.copyWith(meta: event.meta));
  }

  void _onDetail(SetRevisedDetailEvent event, Emitter<RevisedListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
