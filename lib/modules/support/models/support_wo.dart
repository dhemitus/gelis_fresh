import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class SupportWo extends Equatable {
  final SupportModel? support;
  final SupportStatus? status;

  const SupportWo({this.status, this.support});

  @override
  List<Object?> get props => [status, support];

  SupportWo copyWith({
    SupportModel? support,
    SupportStatus? status
  }) => SupportWo(
    status: status ?? this.status,
    support: support ?? this.support
  );
}
