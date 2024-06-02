import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class WoListBloc extends Bloc<WoListEvent, WoListState> {
  final WoListRepository _woListRepository;

  WoListBloc(WoListRepository woListRepository) : _woListRepository = woListRepository, super(const WoListState()) {
    on<GetWoListEvent>(_onLoad);
    on<SetWoDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetWoListEvent event, Emitter<WoListState> emit) async {
    try {
      List<WoItem> l = await _woListRepository.loadWoList();
      emit(state.copyWith(list: l, status: WoListStatus.success));
    } catch(_) {
      emit(state.copyWith(status: WoListStatus.failure));
    }
  }

  void _onDetail(SetWoDetailEvent event, Emitter<WoListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
