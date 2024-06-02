import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final SupportRepository _supportRepository;

  SupportBloc(SupportRepository supportRepository) : _supportRepository = supportRepository, super(const SupportState()) {
    on<SetSupportMemberEvent>(_onMember);
    on<SetSupportResultEvent>(_onResult);
    on<SetSupportTimeEvent>(_onTime);
    on<SetSupportDetailEvent>(_onDetail);
    on<SetSupportEvent>(_onSupport);
  }

  Future<void> _onSupport(SetSupportEvent event, Emitter<SupportState> emit) async {
    try {
      emit(state.copyWith(status: SupportStatus.loading));
      SupportWo s = await _supportRepository.sendSupport(event.support);
      emit(state.copyWith(status: s.status));
    } catch (e) {
      emit(state.copyWith(status: SupportStatus.failure));
    }
  }

  void _onMember(SetSupportMemberEvent event, Emitter<SupportState> emit) {
    emit(state.copyWith(member: event.member, status: SupportStatus.loading));
  }

  void _onResult(SetSupportResultEvent event, Emitter<SupportState> emit) {
    emit(state.copyWith(result: event.result, status: SupportStatus.loading));
  }

  void _onTime(SetSupportTimeEvent event, Emitter<SupportState> emit) {
    emit(state.copyWith(time: event.time, status: SupportStatus.loading));
  }

  void _onDetail(SetSupportDetailEvent event, Emitter<SupportState> emit) {
    emit(state.copyWith(detail: event.detail, status: SupportStatus.loading));
  }
}
