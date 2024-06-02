part of './bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User user;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User u) : this._(status: AuthenticationStatus.authenticated, user: u);

  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}