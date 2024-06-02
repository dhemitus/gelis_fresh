import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class TransferWo extends Equatable {
  final WoModel? wo;
  final TransferStatus? status;
  final int? change;
  const TransferWo({this.wo, this.status, this.change});

  @override
  List<Object?> get props => [wo, status, change];

  TransferWo copyWith({
    WoModel? wo,
    TransferStatus? status,
    int? change
  }) => TransferWo(
    wo: wo ?? this.wo,
    status: status ?? this.status,
    change: change ?? this.change
  );
}
