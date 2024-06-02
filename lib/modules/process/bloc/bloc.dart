import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class ProcessBloc extends Bloc<ProcessEvent, ProcessState> {
  final ProcessRepository _processRepository;

  ProcessBloc(ProcessRepository processRepository) : _processRepository = processRepository, super(const ProcessState()) {
    on<SetProcessNoteEvent>(_onNote);
    on<SetProcessMemberEvent>(_onMember);
    on<SetProcessPlateEvent>(_onPlate);
    on<SetProcessResultEvent>(_onResult);
    on<SetProcessDoneEvent>(_onDone);
    on<SetProcessEvent>(_onSubmit);
  }

  void _onNote(SetProcessNoteEvent event, Emitter<ProcessState> emit) {
    emit(state.copyWith(status: ProcessStatus.loading));
    emit(state.copyWith(note: event.note));
  }

  void _onMember(SetProcessMemberEvent event, Emitter<ProcessState> emit) {
    emit(state.copyWith(member: event.member, status: ProcessStatus.loading));
  }

  void _onPlate(SetProcessPlateEvent event, Emitter<ProcessState> emit) {
    emit(state.copyWith(plate: event.plate, status: ProcessStatus.loading));
  }

  void _onResult(SetProcessResultEvent event, Emitter<ProcessState> emit) {
    emit(state.copyWith(result: event.result, status: ProcessStatus.loading));
  }

  void _onDone(SetProcessDoneEvent event, Emitter<ProcessState> emit) {
    emit(state.copyWith(done: event.done, status: ProcessStatus.loading));
  }

  Future<void> _onSubmit(SetProcessEvent event, Emitter<ProcessState> emit) async {
    try {
      emit(state.copyWith(status: ProcessStatus.loading));
      ProcessWo o = await _processRepository.sendProcess(event.process);
      emit(state.copyWith(status: o.status));
    } catch (e) {
      emit(state.copyWith(status: ProcessStatus.failure));
    }
  }
}
