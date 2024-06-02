import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class OnGoingWo extends Equatable {
  final List<WoModel>? list;
  final OnGoingListStatus? status;

  const OnGoingWo({this.list, this.status});

  @override
  List<Object?> get props => [list, status];

  OnGoingWo copyWith({
    List<WoModel>? list,
    OnGoingListStatus? status
  }) => OnGoingWo(
    list: list ?? this.list,
    status: status ?? this.status
  );
}
