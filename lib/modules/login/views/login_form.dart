import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:logger/logger.dart';
//import 'package:formz/formz.dart';
//import 'package:gelis_widget/gelis_widget.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final log = Logger();

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if(state.status.isFailure) {
          /*ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('eee')));*/
            log.d('gagal login');
        }
      },
      builder: (BuildContext context, LoginState state) {
        return LoginPage(
          username: const UsernameInput(),
          password: const PasswordInput(),
          button: const LoginSubmit(),
          alert: 'Email or password Incorrect',
          error: state.status.isFailure,
        );
      },
    );
  }
}
