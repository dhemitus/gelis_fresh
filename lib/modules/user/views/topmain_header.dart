import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class TopMainHeader extends StatelessWidget {
  const TopMainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        return MainHeader(
          label: state.user.fullname ?? '',
          text: state.user.username ?? '',
          icon: state.user.image ?? '',
        );
      }
    );
  }
}
