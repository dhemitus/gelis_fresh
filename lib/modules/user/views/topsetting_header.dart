import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class TopSettingHeader extends StatelessWidget {
  const TopSettingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {

        return SettingHeader(
          label: state.user.fullname ?? '',
          text: state.user.username ?? '',
          icon: state.user.image ?? '',
        ); 
      }
    );
  }
}
