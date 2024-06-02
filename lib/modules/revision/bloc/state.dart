part of './bloc.dart';

enum RevisionListStatus { loading, success, failure, detail }

class RevisionListState extends Equatable {
  final RevisionListStatus status;
  final List<WoModel> list;
  final WoModel wo;
  final WoMetaModel meta;
  final String search;

  const RevisionListState({
    this.status = RevisionListStatus.loading,
    this.list = const <WoModel>[],
    this.wo = const WoModel(),
    this.meta = const WoMetaModel(skip: 0, limit: 10, numrows: 0),
    this.search = ''
  });

  RevisionListState copyWith({
    RevisionListStatus? status,
    List<WoModel>? list,
    WoModel? wo,
    WoMetaModel? meta,
    String? search
  }) => RevisionListState(
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
