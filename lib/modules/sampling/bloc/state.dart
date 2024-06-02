part of './bloc.dart';

enum SamplingStatus { loading, success, failure, detail }

class SamplingState extends Equatable {
  final SamplingStatus status;
  final List<WoSampleModel> list;
  final WoSampleModel sample;
  final String id;

  const SamplingState({
    this.status = SamplingStatus.loading,
    this.list = const <WoSampleModel>[],
    this.sample = const WoSampleModel(),
    this.id = ''
  });

  SamplingState copyWith({
    SamplingStatus? status,
    List<WoSampleModel>? list,
    WoSampleModel? sample,
    String? id
  }) => SamplingState(
    status: status ?? this.status,
    list: list ?? this.list,
    sample: sample ?? this.sample,
    id: id ?? this.id
  );

  @override
  List<Object> get props => [status, list, sample, id];
}
