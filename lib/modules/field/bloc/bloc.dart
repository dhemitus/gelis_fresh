import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class FieldBloc extends Bloc<FieldEvent, FieldState> {
  final FieldRepository _fieldRepository;

  FieldBloc(FieldRepository fieldRepository) : _fieldRepository = fieldRepository, super(const FieldState()) {
    on<SetFieldEvent>(_onField);
    on<SetFieldFirstEvent>(_onFirst);
    on<SetFieldLastEvent>(_onLast);
    on<SetFieldTestEvent>(_onTest);
    on<SetFieldSimploEvent>(_onSimplo);
    on<SetFieldDuploEvent>(_onDuplo);
    on<SetFieldFlatEvent>(_onFlat);
    on<SetFieldRdpEvent>(_onRdp);
    on<SetFieldNoteEvent>(_onNote);
    on<SetFieldActualEvent>(_onActual);
    on<SetFieldVerifyEvent>(_onVerify);
    on<SetFieldRangeEvent>(_onRange);
    on<SetFieldQualityEvent>(_onQuality);
    on<SetFieldQuantityEvent>(_onQuantity);
    on<SetFieldFlowEvent>(_onFlow);
    on<SetFieldMemberEvent>(_onMember);
    on<SetFieldDetailEvent>(_onDetail);
  }

  Future<void> _onField(SetFieldEvent event, Emitter<FieldState> emit) async {
    try {
      emit(state.copyWith(status: FieldStatus.loading));
      FieldWo f = await _fieldRepository.sendfield(event.field);
      emit(state.copyWith(status: f.status));
    } catch (e) {
      emit(state.copyWith(status: FieldStatus.failure));
    }
  }

  void _onFirst(SetFieldFirstEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(first: event.first, status: FieldStatus.loading));
  }

  void _onLast(SetFieldLastEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(last: event.last, status: FieldStatus.loading));
  }

  void _onTest(SetFieldTestEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(test: event.test, status: FieldStatus.loading));
  }

  void _onSimplo(SetFieldSimploEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(simplo: event.simplo, status: FieldStatus.loading));
  }

  void _onDuplo(SetFieldDuploEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(duplo: event.duplo, status: FieldStatus.loading));
  }

  void _onFlat(SetFieldFlatEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(flat: event.flat, status: FieldStatus.loading));
  }

  void _onRdp(SetFieldRdpEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(rdp: event.rdp, status: FieldStatus.loading));
  }

  void _onNote(SetFieldNoteEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(note: event.note, status: FieldStatus.loading));
  }

  void _onActual(SetFieldActualEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(actual: event.actual, status: FieldStatus.loading));
  }

  void _onVerify(SetFieldVerifyEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(verify: event.verify, status: FieldStatus.loading));
  }

  void _onRange(SetFieldRangeEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(range: event.range, status: FieldStatus.loading));
  }

  void _onQuality(SetFieldQualityEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(quality: event.quality, status: FieldStatus.loading));
  }

  void _onQuantity(SetFieldQuantityEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(quantity: event.quantity, status: FieldStatus.loading));
  }

  void _onFlow(SetFieldFlowEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(flow: event.flow, status: FieldStatus.loading));
  }

  void _onMember(SetFieldMemberEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(member: event.member, status: FieldStatus.loading));
  }

  void _onDetail(SetFieldDetailEvent event, Emitter<FieldState> emit) {
    emit(state.copyWith(detail: event.detail, status: FieldStatus.loading));
  }

}
