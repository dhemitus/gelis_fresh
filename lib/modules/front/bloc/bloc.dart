import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

part './event.dart';
part './state.dart';

class FrontBloc extends Bloc<FrontListEvent, FrontListState> {
  final FrontRepository _frontRepository;

  FrontBloc(FrontRepository frontRepository) : _frontRepository = frontRepository, super(const FrontListState()) {
    on<GetFrontListEvent>(_onLoad);
    on<GetFrontDateEvent>(_onDate);
    on<SetFrontDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetFrontListEvent event, Emitter<FrontListState> emit) async {
    try {
      emit(state.copyWith(status: FrontListStatus.loading));
      FrontWo l = await _frontRepository.loadWoList(
        date: state.date,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, status: l.status));
    } catch(_) {
      emit(state.copyWith(status: FrontListStatus.failure));
    }
  }

  Future<void> _onDate(GetFrontDateEvent event, Emitter<FrontListState> emit) async {
    emit(state.copyWith(date: event.date));
  }

  void _onDetail(SetFrontDetailEvent event, Emitter<FrontListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}

