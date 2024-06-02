import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  final TransferRepository _transferRepository;
  
  TransferBloc(TransferRepository transferRepository) : _transferRepository = transferRepository, super(const TransferState()) {
    on<TransferChangeEvent>(_onSend);
  }

  Future<void> _onSend(TransferChangeEvent event, Emitter<TransferState> emit) async {
    try {
      emit(state.copyWith(status: TransferStatus.loading));
      TransferWo w = await _transferRepository.sendTransfer(event.wo, event.change);
      emit(state.copyWith(status: w.status));
    } catch (e) {
      emit(state.copyWith(status: TransferStatus.failure));
    }
  }
}

