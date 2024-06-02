import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuListRepository _menuListRepository;

  MenuBloc(MenuListRepository menuListRepository) : _menuListRepository = menuListRepository, super(const MenuState()) {
    on<GetMenuListEvent>(_onMenu);
  }
  Future<void> _onMenu(GetMenuListEvent event, Emitter<MenuState> emit) async {
    try {
      List<DsItem> l = await _menuListRepository.loadDashboardMenu();
      emit(state.copyWith(menu: l, status: MenuStatus.success));
    } catch(_) {
      emit(state.copyWith(status: MenuStatus.failure));
    }
  }
}
