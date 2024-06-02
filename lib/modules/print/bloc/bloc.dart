import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class PrintBloc extends Bloc<PrintEvent, PrintState> {
  final PrintRepository _printRepository;

  PrintBloc(PrintRepository printRepository) : _printRepository = printRepository, super(const PrintState()){
    on<SetPrintDataEvent>(_onPrint);
    on<GetPrintDataEvent>(_onDetail);
  }

  Future<void> _onPrint(SetPrintDataEvent event, Emitter<PrintState> emit) async{
    try {
      emit(state.copyWith(status: PrintStatus.loading));
      PrintModel m = PrintModel(wo: event.data);
      PrintWo d = await _printRepository.preview(m);
      emit(state.copyWith(status: PrintStatus.success, print: d.print));
    } catch (e) {
      emit(state.copyWith(status: PrintStatus.failure));
    }
  }

  Future<void> _onDetail(GetPrintDataEvent event, Emitter<PrintState> emit) async {
    try {
      emit(state.copyWith(status: PrintStatus.loading));
      PrintWo w = await _printRepository.loadWoDetail(no: event.id);
      emit(state.copyWith(wo: w.detail, print: w.print, status: PrintStatus.detail));
    } catch (e) {
      emit(state.copyWith(status: PrintStatus.failure));
    }
  }
}
