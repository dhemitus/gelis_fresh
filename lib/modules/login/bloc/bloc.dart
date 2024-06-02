import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:gelis/modules/modules.dart';

part './event.dart';
part './state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _repository;
  LoginBloc(AuthenticationRepository repository) : _repository = repository,
  super(const LoginState()) {
    on<LoginUsernameEvent>(_onUsername);
    on<LoginPasswordEvent>(_onPassword);
    on<LoginSwitchEvent>(_onSwitch);
    on<LoginSubmitEvent>(_onSubmit);
  }

  void _onUsername(LoginUsernameEvent event, Emitter<LoginState> emit) {
    final username = Username.dirty(value: event.username);
    emit(
      state.copyWith(
        username: username, 
        status: FormzSubmissionStatus.initial
        //status: Formz.validate([state.password, username]) ? FormzSubmissionStatus.initial : FormzSubmissionStatus.failure
      )
    );
  }

  void _onPassword(LoginPasswordEvent event, Emitter<LoginState> emit) {
    final password = Password.dirty(value: event.password);
    emit(
        state.copyWith(
        password: password, 
        status: FormzSubmissionStatus.initial
        //status: Formz.validate([password, state.username]) ? FormzSubmissionStatus.initial : FormzSubmissionStatus.failure
      )
    );
  }

  void _onSwitch(LoginSwitchEvent event, Emitter<LoginState> emit) {
    emit(
        state.copyWith(hide: event.hide)
    );
  }

  Future<void> _onSubmit(LoginSubmitEvent event, Emitter<LoginState> emit) async {
    if(state.status.isInitial) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        AuthenticationModel auth = AuthenticationModel(username: state.username.value, password: state.password.value);
        bool b = await _repository.login(auth: auth);

        emit(state.copyWith(status: b ? FormzSubmissionStatus.success : FormzSubmissionStatus.failure));
      } catch(_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
