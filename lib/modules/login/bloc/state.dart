part of './bloc.dart';

class LoginState extends Equatable {
  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final bool hide;

  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.hide = true
  });

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    bool? hide
  }) => LoginState(
    status: status ?? this.status,
    username: username ?? this.username,
    password: password ?? this.password,
    hide: hide ?? this.hide
  );

  @override
  List<Object> get props => [status, username, password, hide];
}
