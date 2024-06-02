import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class WoDetailBloc extends Bloc<WoDetailEvent, WoDetailState> {
  final WoDetailRepository _woDetailRepository;

  WoDetailBloc(WoDetailRepository woDetailRepository) : _woDetailRepository = woDetailRepository, super(const WoDetailState()) {
    on<GetWoDetailEvent>(_onLoad);
  }

  Future<void> _onLoad(GetWoDetailEvent event, Emitter<WoDetailState> emit) async {
    try {
      emit(state.copyWith(status: WoDetailStatus.loading));
      WoDetail l = await _woDetailRepository.loadWoDetail(no : event.no);
      emit(state.copyWith(wo: l.detail, status: WoDetailStatus.success));
    } catch(_) {
      emit(state.copyWith(status: WoDetailStatus.failure));
    }
  }
}
