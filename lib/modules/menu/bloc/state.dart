part of './bloc.dart';

enum MenuStatus { loading, success, failure, detail }

class MenuState extends Equatable {
  final MenuStatus status;
  final List<DsItem> menu;

  const MenuState({this.status = MenuStatus.loading, this.menu = const <DsItem>[]});

  MenuState copyWith({
    MenuStatus? status,
    List<DsItem>? menu,
  }) => MenuState(
    status: status ?? this.status,
    menu: menu ?? this.menu,
  );

/*  const WoListState.loading() : this._();

  const WoListState.success(List<WoItem> list)
  : this._(status: WoListStatus.success, list: list);

  const WoListState.failure() : this._(status: WoListStatus.failure);

  const WoListState.detail(WoItem wo)
      : this._(status: WoListStatus.detail, wo: wo);*/

  @override
  List<Object> get props => [status, menu];
}
