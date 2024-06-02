import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/molecules/containers/alertcontainer_molecule.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LoginPage extends StatelessWidget {
  final Widget? username, password, button;
  final bool error;
  final String? alert;

  const LoginPage({Key? key, this.username, this.password, this.button, this.error = false, this.alert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          const LoginContainer(),
          BaseContainer(
            alignment: Alignment.bottomCenter,
            width: 1.sw,
            height: 392.w,
            child: cloud,
          ),
          Padding(
            padding: EdgeInsets.only(left: 48.0.w, right: 48.w, top: 112.w),
            child: const LogoContainer(),
          ),
          const Positioned(
            bottom: 0,
            child: PowerContainer()
          ),
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BaseContainer(
                  height: 180.0.w,
                ),
                SingleChildScrollView(
                  child: LoginForm(
                    button: button, 
                    username: username, 
                    password: password, 
                    error: error ? AlertContainer(label: alert ?? '',) : Container()
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
