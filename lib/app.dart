import 'package:flutter/material.dart';
import 'package:gelis/modules/modules.dart';
import 'package:gelis/blocs.dart';

class App extends StatelessWidget {
  final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Blocs.repoList(
      Blocs.blocsList(
        AuthenticationScreen(navKey: _navKey),
        _navKey
      ),
    );
  }
}
