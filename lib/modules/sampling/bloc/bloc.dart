import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class SamplingBloc extends Bloc<SamplingEvent, SamplingState> {
  final SamplingRepository _samplingRepository;
  
  SamplingBloc(SamplingRepository samplingRepository) : _samplingRepository = samplingRepository, super(const SamplingState()) {
    on<SetSamplingDetailEvent>(_onDetail);
    on<GetSamplingDetailEvent>(_onLoad);
  }

  void _onDetail(SetSamplingDetailEvent event, Emitter<SamplingState> emit) {
    emit(state.copyWith(sample: event.sample));
  }

  Future<void> _onLoad(GetSamplingDetailEvent event, Emitter<SamplingState> emit) async {
    try {
      emit(state.copyWith(status: SamplingStatus.loading));
      SampleDetail s = await _samplingRepository.loadSample(id: event.id);
      emit(state.copyWith(sample: s.sample, status: s.status));
    } catch (e) {
      emit(state.copyWith(status: SamplingStatus.failure));
    }
  }
}
