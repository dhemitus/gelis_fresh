part of './bloc.dart';

enum TransferStatus { loading, success, failure, detail }

class TransferState extends Equatable {
  final TransferStatus status;
  final TransferWo transfer;
  final int change;

  const TransferState({
    this.status = TransferStatus.loading,
    this.transfer = const TransferWo(),
    this.change = 0
  });

  TransferState copyWith({
    TransferStatus? status,
    TransferWo? transfer,
    int? change
  }) => TransferState(
    status: status ?? this.status,
    transfer: transfer ?? this.transfer,
    change: change ?? this.change
  );

    @override
  List<Object> get props => [status, transfer, change];
}
