part of './bloc.dart';

enum PrintStatus { loading, success, failure, detail }

class PrintState extends Equatable {
  final PrintStatus status;
  final WoDetailModel wo;
  final PrintModel print;
  final String name;

  const PrintState({
    this.status = PrintStatus.loading,
    this.wo = const WoDetailModel(),
    this.print = const PrintModel(),
    this.name = ''
  });

  PrintState copyWith({
    PrintStatus? status,
    WoDetailModel? wo,
    PrintModel? print,
    String? name
  }) => PrintState(
    status: status ?? this.status,
    wo: wo ?? this.wo,
    print: print ?? this.print,
    name: name ?? this.name
  );

  @override
  List<Object> get props => [status, wo, print, name];
}
