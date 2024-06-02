part of './bloc.dart';

enum OnGoingListStatus { loading, success, failure, detail }

class OnGoingListState extends Equatable {
  final OnGoingListStatus status;
  final List<WoModel> list;
  final WoModel wo;
  final WoMetaModel meta;
  final String search;

  const OnGoingListState({
    this.status = OnGoingListStatus.loading,
    this.list = const <WoModel>[],
    this.wo = const WoModel(),
    this.meta = const WoMetaModel(skip: 0, limit: 10, numrows: 0),
    this.search = ''
  });

  OnGoingListState copyWith({
    OnGoingListStatus? status,
    List<WoModel>? list,
    WoModel? wo,
    WoMetaModel? meta,
    String? search
  }) => OnGoingListState(
    status: status ?? this.status,
    list: list ?? this.list,
    wo: wo ?? this.wo,
    meta: meta ?? this.meta,
    search: search ?? this.search
  );

/*  const WoListState.loading() : this._();

  const WoListState.success(List<WoItem> list)
  : this._(status: WoListStatus.success, list: list);

  const WoListState.failure() : this._(status: WoListStatus.failure);

  const WoListState.detail(WoItem wo)
      : this._(status: WoListStatus.detail, wo: wo);*/

  @override
  List<Object> get props => [status, list, wo, meta, search];
}
