import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class SampleDetail extends Equatable {
  final WoSampleModel? sample;
  final SamplingStatus? status;
  const SampleDetail({this.sample, this.status});

  @override
  List<Object?> get props => [sample, status];

  SampleDetail copyWith({
    WoSampleModel? sample,
    SamplingStatus? status
  }) => SampleDetail(
    sample: sample ?? this.sample,
    status: status ?? this.status
  );
}
