part of './bloc.dart';

enum FrontListStatus { loading, success, failure, detail }

class FrontListState extends Equatable {
  final FrontListStatus status;
  final List<WoModel> list;
  final WoModel wo;
  final WoMetaModel meta;
  final String date;

  const FrontListState({
    this.status = FrontListStatus.loading,
    this.list = const <WoModel>[],
    this.wo = const WoModel(),
    this.meta = const WoMetaModel(skip: 0, limit: 60, numrows: 0),
    this.date = ''
  });

  FrontListState copyWith({
    FrontListStatus? status,
    List<WoModel>? list,
    WoModel? wo,
    WoMetaModel? meta,
    String? date
  }) => FrontListState(
    status: status ?? this.status,
    list: list ?? this.list,
    wo: wo ?? this.wo,
    meta: meta ?? this.meta,
    date: date ?? this.date
  );

  @override
  List<Object> get props => [status, list, wo, meta, date];
}
