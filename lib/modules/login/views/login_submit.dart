import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
//import 'package:formz/formz.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LoginSubmit extends StatelessWidget {
  const LoginSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
//      buildWhen: (previus, current) => previus.status != current.status,
      builder: (BuildContext context, LoginState state) {
        return state.status.isInProgress ? const CircularProgressIndicator() :
        LoginButton(
          text:'login'.toUpperCase(),
          onTap:  () => context.read<LoginBloc>().add(const LoginSubmitEvent()),
        );
      }
    );
  }
}
