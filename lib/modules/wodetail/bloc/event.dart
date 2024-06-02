part of './bloc.dart';

abstract class WoDetailEvent extends Equatable {
  const WoDetailEvent();

  @override
  List<Object> get props => [];
}

class GetWoDetailEvent extends WoDetailEvent {
  final String no;
  const GetWoDetailEvent(this.no);

  @override
  List<Object> get props =>[no];
}
