import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class OnGoingListBloc extends Bloc<OnGoingListEvent, OnGoingListState> {
  final OnGoingListRepository _onGoingListRepository;

  OnGoingListBloc(OnGoingListRepository onGoingListRepository) : _onGoingListRepository = onGoingListRepository, super(const OnGoingListState()) {
    on<GetOnGoingInitEvent>(_onInit);
    on<GetOnGoingListEvent>(_onLoad);
    on<GetOnGoingSearchEvent>(_onSearch);
    on<GetOnGoingMetaEvent>(_onMeta);
    on<SetOnGoingDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetOnGoingListEvent event, Emitter<OnGoingListState> emit) async {
    try {
      emit(state.copyWith(status: OnGoingListStatus.loading));
      OnGoingWo l = await _onGoingListRepository.loadWoList(
        search: state.search,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, status: l.status));
    } catch(_) {
      emit(state.copyWith(status: OnGoingListStatus.failure));
    }
  }

  Future<void> _onInit(GetOnGoingInitEvent event, Emitter<OnGoingListState> emit) async {
    emit(const OnGoingListState());
  }

  Future<void> _onSearch(GetOnGoingSearchEvent event, Emitter<OnGoingListState> emit) async {
    emit(state.copyWith(search: event.search));
  }

  Future<void> _onMeta(GetOnGoingMetaEvent event, Emitter<OnGoingListState> emit) async {
    emit(state.copyWith(meta: event.meta));
  }

  void _onDetail(SetOnGoingDetailEvent event, Emitter<OnGoingListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
