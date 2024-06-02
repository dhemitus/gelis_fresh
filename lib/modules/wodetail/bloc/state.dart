part of './bloc.dart';

/*enum WoDetailListStatus { loading, success, failure, detail }

class WoDetailListState extends Equatable {
  final WoDetailListStatus status;
  final List<WoDetailItem> list;
  final WoDetailItem wo;

  const WoDetailListState({this.status = WoDetailListStatus.loading, this.list = const <WoDetailItem>[], this.wo = const WoDetailItem()});

  WoDetailListState copyWith({
    WoDetailListStatus? status,
    List<WoDetailItem>? list,
    WoDetailItem? wo
  }) => WoDetailListState(
      status: status ?? this.status,
      list: list ?? this.list,
      wo: wo ?? this.wo
  );

  @override
  List<Object> get props => [status, list, wo];
}*/

enum WoDetailStatus { loading, success, failure, detail }

class WoDetailState extends Equatable {
  final WoDetailStatus status;
  final List<WoDetailModel> list;
  final WoDetailModel wo;
  final String no;

  const WoDetailState({this.status = WoDetailStatus.loading, this.list = const <WoDetailModel>[], this.wo = const WoDetailModel(), this.no = ''});

  WoDetailState copyWith({
    WoDetailStatus? status,
    List<WoDetailModel>? list,
    WoDetailModel? wo,
    String? no
  }) => WoDetailState(
    status: status ?? this.status,
    list: list ?? this.list,
    wo: wo ?? this.wo,
    no: no ?? this.no
  );

  @override
  List<Object> get props => [status, list, wo];
}
