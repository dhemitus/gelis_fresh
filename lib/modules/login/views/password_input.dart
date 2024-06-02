import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
//        buildWhen: (previus, current) => previus.password != current.password,
        builder: (BuildContext context, LoginState state) {
          return ShadowInputText(
            onChange: (password) => context.read<LoginBloc>().add(LoginPasswordEvent(password)),
            hint: 'Password',
            password: state.hide,
            suffix: const ShowInput(),
            preffix: IconContainer(child: lock),
          );
        });
  }
}
