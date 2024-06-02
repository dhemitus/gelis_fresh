part of './bloc.dart';

abstract class PrintEvent extends Equatable {
  const PrintEvent();

  @override
  List<Object> get props => [];
}

class GetPrintDataEvent extends PrintEvent {
  final String id;

  const GetPrintDataEvent(this.id);

  @override
  List<Object> get props => [id];
}

class SetPrintDataEvent extends PrintEvent {
  final WoDetailModel data;

  const SetPrintDataEvent(this.data);

  @override
  List<Object> get props => [data];
}
