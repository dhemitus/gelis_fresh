import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class FrontWo extends Equatable {
  final List<WoModel>? list;
  final FrontListStatus? status;

  const FrontWo({this.list, this.status});

  @override
  List<Object?> get props => [list, status];

  FrontWo copyWith({
    List<WoModel>? list,
    FrontListStatus? status
  }) => FrontWo(
    list: list ?? this.list,
    status: status ?? this.status
  );
}
