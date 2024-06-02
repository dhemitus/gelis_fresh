import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

class WoDetail extends Equatable {
  final List<WoDetailModel>? list;
  final WoDetailModel? detail;
  final WoDetailStatus? status;

  const WoDetail({this.list, this.detail, this.status});

  @override
  List<Object?> get props => [list, detail, status];

  WoDetail copyWith({
    List<WoDetailModel>? list,
    WoDetailModel? detail,
    WoDetailStatus? status
  }) => WoDetail(
    list: list ?? this.list,
    detail: detail ?? this.detail,
    status: status ?? this.status
  );
}
