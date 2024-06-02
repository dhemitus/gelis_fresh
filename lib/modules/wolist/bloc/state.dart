part of './bloc.dart';

enum WoListStatus { loading, success, failure, detail }

class WoListState extends Equatable {
  final WoListStatus status;
  final List<WoItem> list;
  final WoItem wo;

  const WoListState({this.status = WoListStatus.loading, this.list = const <WoItem>[], this.wo = const WoItem()});

  WoListState copyWith({
    WoListStatus? status,
    List<WoItem>? list,
    WoItem? wo
  }) => WoListState(
    status: status ?? this.status,
    list: list ?? this.list,
    wo: wo ?? this.wo
  );

/*  const WoListState.loading() : this._();

  const WoListState.success(List<WoItem> list)
  : this._(status: WoListStatus.success, list: list);

  const WoListState.failure() : this._(status: WoListStatus.failure);

  const WoListState.detail(WoItem wo)
      : this._(status: WoListStatus.detail, wo: wo);*/

  @override
  List<Object> get props => [status, list, wo];
}
