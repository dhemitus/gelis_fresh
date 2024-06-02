part of './bloc.dart';

abstract class SamplingEvent extends Equatable {
  const SamplingEvent();

  @override
  List<Object> get props => [];
}

class GetSamplingDetailEvent extends SamplingEvent {
  final int id;

  const GetSamplingDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}

class SetSamplingDetailEvent extends SamplingEvent {
  final WoSampleModel sample;
  const SetSamplingDetailEvent(this.sample);

  @override
  List<Object> get props => [sample];
}
