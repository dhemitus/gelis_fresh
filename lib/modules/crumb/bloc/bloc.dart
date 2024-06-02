import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class CrumbBloc extends Bloc<CrumbEvent, CrumbState> {
  final CrumbRepository _crumbRepository;

  CrumbBloc(CrumbRepository crumbRepository) : _crumbRepository = crumbRepository, super(const CrumbState()) {
    on<GetCrumbEvent>(_onMenu);
    on<SetCrumbEvent>(_onCrumb);
  }

  Future<void> _onMenu(GetCrumbEvent event, Emitter<CrumbState> emit) async {
    try {
      List<CrumbItem> c = await _crumbRepository.loadCrumbMenu();
      emit(state.copyWith(menu: c, crumb: c[0], status: CrumbStatus.success));
    } catch (_) {
      emit(state.copyWith(status: CrumbStatus.failure));
    }
  }

  void _onCrumb(SetCrumbEvent event, Emitter<CrumbState> emit) {
    emit(state.copyWith(crumb: event.crum));
  }
}
