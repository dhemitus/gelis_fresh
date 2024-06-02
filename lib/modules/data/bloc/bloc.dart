import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

part './event.dart';
part './state.dart';

class DataListBloc extends Bloc<DataListEvent, DataListState> {
   final log = Logger();

 final DataListRepository _dataListRepository;

  DataListBloc(DataListRepository dataListRepository) : _dataListRepository = dataListRepository, super(const DataListState()) {
    on<GetDataInitEvent>(_onInit);
    on<GetDataListEvent>(_onLoad);
    on<GetDataMetaEvent>(_onMeta);
    on<GetDataSearchEvent>(_onSearch);
    on<SetDataDetailEvent>(_onDetail);
  }

  Future<void> _onLoad(GetDataListEvent event, Emitter<DataListState> emit) async {
    try {
      emit(state.copyWith(status: DataListStatus.loading));
      DataListWo l = await _dataListRepository.loadWoList(
        search: state.search,
        limit: state.meta.limit!,
        skip: state.meta.skip!
      );
      emit(state.copyWith(list: l.list, status: l.status));
    } catch(_) {
      emit(state.copyWith(status: DataListStatus.failure));
    }
  }

  void _onInit(GetDataInitEvent event, Emitter<DataListState> emit) {
    emit(const DataListState());
  }

  void _onSearch(GetDataSearchEvent event, Emitter<DataListState> emit) {
    emit(state.copyWith(search: event.search));
  }

  void _onMeta(GetDataMetaEvent event, Emitter<DataListState> emit) {
    emit(state.copyWith(meta: event.meta));
  }

  void _onDetail(SetDataDetailEvent event, Emitter<DataListState> emit) {
    emit(state.copyWith(wo: event.wo));
  }
}
