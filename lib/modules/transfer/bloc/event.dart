part of './bloc.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class TransferChangeEvent extends TransferEvent {
  final int change;
  final WoModel wo;
  const TransferChangeEvent(this.change, this.wo);

  @override
  List<Object> get props => [change, wo];
}
