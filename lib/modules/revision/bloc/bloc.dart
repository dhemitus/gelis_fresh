import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class RevisionListBloc extends Bloc<RevisionListEvent, RevisionListState> {
  final RevisionListRepository _revisionListRepository;

  RevisionListBloc(RevisionListRepository revisionListRepository) : _revisionListRepository = revisionListRepository, super(const RevisionListState()) {
    on<GetRevisionInitEvent>(_onInit);
    on<GetRevisionListEvent>(_onLoad);
    on<GetRevisionSearchEvent>(_onSearch);
    on<GetRevisionMetaEvent>(_onMeta);
    on<SetRevisionDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetRevisionListEvent event, Emitter<RevisionListState> emit) async {
    try {
      emit(state.copyWith(status: RevisionListStatus.loading));
      RevisionWo l = await _revisionListRepository.loadWoList(
        search: state.search,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, status: l.status));
    } catch(_) {
      emit(state.copyWith(status: RevisionListStatus.failure));
    }
  }

  void _onInit(GetRevisionInitEvent event, Emitter<RevisionListState> emit) {
    emit(const RevisionListState());
  }
  void _onSearch(GetRevisionSearchEvent event, Emitter<RevisionListState> emit) {
    emit(state.copyWith(search: event.search));
  }
  
  void _onMeta(GetRevisionMetaEvent event, Emitter<RevisionListState> emit) {
    emit(state.copyWith(meta: event.meta));
  }

  void _onDetail(SetRevisionDetailEvent event, Emitter<RevisionListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
