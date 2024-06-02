part of './bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameEvent extends LoginEvent {
  final String username;
  const LoginUsernameEvent(this.username);

  @override
  List<Object> get props => [username];
}

class LoginPasswordEvent extends LoginEvent {
  final String password;
  const LoginPasswordEvent(this.password);

  @override
  List<Object> get props => [password];
}

class LoginSwitchEvent extends LoginEvent {
  final bool hide;
  const LoginSwitchEvent(this.hide);

  @override
  List<Object> get props => [hide];
}

class LoginSubmitEvent extends LoginEvent {
  const LoginSubmitEvent();
}