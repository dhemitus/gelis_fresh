import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
//        buildWhen: (previus, current) => previus.username != current.username,
    builder: (BuildContext context, LoginState state) {
      return ShadowInputText(
        onChange: (username) => context.read<LoginBloc>().add(LoginUsernameEvent(username)),
        hint: 'Username',
        preffix: IconContainer(child: message)
      );
    });
  }
}
