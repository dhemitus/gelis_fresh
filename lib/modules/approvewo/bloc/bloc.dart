import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

part './event.dart';
part './state.dart';

class ApproveWoListBloc extends Bloc<ApproveWoListEvent, ApproveWoListState> {
  final ApproveWoListRepository _approveWoListRepository;

  final log = Logger();
  ApproveWoListBloc(ApproveWoListRepository approveWoListRepository) : _approveWoListRepository = approveWoListRepository, super(const ApproveWoListState()) {
    on<GetApproveWoInitEvent>(_onInit);
    on<GetApproveWoListEvent>(_onLoad);
    on<GetApproveWoSearchEvent>(_onSearch);
    on<GetApproveWoMetaEvent>(_onMeta);
    on<SetApproveWoDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetApproveWoListEvent event, Emitter<ApproveWoListState> emit) async {
    try {
      emit(state.copyWith(status: ApproveWoListStatus.loading));
      ApproveWo l = await _approveWoListRepository.loadWoList(
        search: state.search,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, meta: l.meta, status: l.status));
    } catch(_) {
      emit(state.copyWith(status: ApproveWoListStatus.failure));
    }
  }

  Future<void> _onSearch(GetApproveWoSearchEvent event, Emitter<ApproveWoListState> emit) async {
    log.d(event.search);
    emit(state.copyWith(search: event.search));
  }

  Future<void> _onMeta(GetApproveWoMetaEvent event, Emitter<ApproveWoListState> emit) async {
    emit(state.copyWith(meta: event.meta));
  }

  Future<void> _onInit(GetApproveWoInitEvent event, Emitter<ApproveWoListState> emit) async {
    emit(const ApproveWoListState());
  }

  void _onDetail(SetApproveWoDetailEvent event, Emitter<ApproveWoListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
