import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class PrintWo extends Equatable {
  final PrintModel? print;
  final WoDetailModel? detail;
  final PrintStatus? status;

  const PrintWo({this.status, this.detail, this.print});

  @override
  List<Object?> get props => [status, detail, print];

  PrintWo copyWith({
    PrintModel? print,
    WoDetailModel? detail,
    PrintStatus? status
  }) => PrintWo(
    print: print ?? this.print,
    detail: detail ?? this.detail,
    status: status ?? this.status
  );
}
