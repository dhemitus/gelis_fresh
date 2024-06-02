import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: LoginRoute.key);

  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}
