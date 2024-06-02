part of './bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class _AuthenticationStatusEvent extends AuthenticationEvent {
  final AuthenticationStatus status;

  const _AuthenticationStatusEvent(this.status);
}

class AuthenticationLogoutEvent extends AuthenticationEvent {

}