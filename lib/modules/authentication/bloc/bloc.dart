import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gelis/modules/modules.dart';
import 'package:logger/logger.dart';

part './event.dart';
part './state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _repository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus> _subscription;

  final log = Logger();
  AuthenticationBloc(AuthenticationRepository repository, UserRepository userRepository) : _repository = repository, _userRepository = userRepository, super(const AuthenticationState.unknown()) {
    on<_AuthenticationStatusEvent>(_onStatus);
    on<AuthenticationLogoutEvent>(_onlogout);
    _subscription = _repository.status.listen((AuthenticationStatus status) {
      add(_AuthenticationStatusEvent(status));
    });
  }

  Future<void> _onStatus(_AuthenticationStatusEvent event, Emitter<AuthenticationState> emit) async {

    switch(event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final u = await _getUser();
        return emit(
            u != null ?
            AuthenticationState.authenticated(u) :
            const AuthenticationState.unauthenticated()
        );
      case AuthenticationStatus.unknown:
        return emit(const AuthenticationState.unknown());
    }
  }

  Future<void> _onlogout(AuthenticationLogoutEvent event, Emitter<AuthenticationState> emit) async {
    _repository.logout();
    await _userRepository.delUser();
  }

  Future<User?> _getUser() async {
    try {
      final u = await _userRepository.getUser();
      log.d(u.toString());
      return u;
    }catch(_) {
      return null;
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _repository.dispose();
    return super.close();
  }

}
