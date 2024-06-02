import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ShowInput extends StatelessWidget {
  const ShowInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.hide != current.hide,
      builder: (BuildContext context, LoginState state) {
        return SwitchEyeButton(
          hide: state.hide,
          onTap: (bool b) => context.read<LoginBloc>().add(LoginSwitchEvent(b))
        );
      }
    );
  }
}
