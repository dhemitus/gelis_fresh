part of './bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}


class GetMenuListEvent extends MenuEvent {}

