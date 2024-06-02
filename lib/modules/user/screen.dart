import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: UserRoute.key);

  @override
  Widget build(BuildContext context) {
    return UserPage(
      head: const TopSettingHeader(),
      child: Column(
        children: [
          SettingListItem(icon: cog, text: 'Preference',),
          SettingListItem(icon: outdoor, text: 'Logout', onTap: () => {
            showDialog(
              context: context,
//                useRootNavigator: true,
                builder: (BuildContext context) {
                  return LogoutDialogCard(
                    onCancel: () => context.read<NavigationBloc>().add(const OnBack()),
                    onOut: () => context.read<AuthenticationBloc>().add(AuthenticationLogoutEvent()),
                  );
                }
              )
            },
          )
        ]
      ),
    );
  }
}
