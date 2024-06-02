import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class CheckListBloc extends Bloc<CheckListEvent, CheckListState> {
  final CheckListRepository _checkListRepository;

  CheckListBloc(CheckListRepository checkListRepository) : _checkListRepository = checkListRepository, super(const CheckListState()) {
    on<GetCheckInitEvent>(_onInit);
    on<GetCheckListEvent>(_onLoad);
    on<GetCheckSearchEvent>(_onSearch);
    on<GetCheckMetaEvent>(_onMeta);
    on<SetCheckDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetCheckListEvent event, Emitter<CheckListState> emit) async {
    try {
      emit(state.copyWith(status: CheckListStatus.loading));
      ChecklistWo l = await _checkListRepository.loadWoList(
        search: state.search,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, status: l.status));
    } catch(_) {
      emit(state.copyWith(status: CheckListStatus.failure));
    }
  }

  Future<void> _onSearch(GetCheckSearchEvent event, Emitter<CheckListState> emit) async {
    emit(state.copyWith(search: event.search));
  }

  Future<void> _onInit(GetCheckInitEvent event, Emitter<CheckListState> emit) async {
    emit(const CheckListState());
  }
  
  Future<void> _onMeta(GetCheckMetaEvent event, Emitter<CheckListState> emit) async {
    emit(state.copyWith(meta: event.meta));
  }

  void _onDetail(SetCheckDetailEvent event, Emitter<CheckListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
