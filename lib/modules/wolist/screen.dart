import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class WoListScreen extends StatelessWidget {
  const WoListScreen({Key? key}) : super(key: WoListRoute.key);


  @override
  Widget build(BuildContext context) {

    return /*BlocProvider(
      create: (_) => HomeBloc(HomeRepository())..add(GetWoListEvent()),
      child: const WoList(),
    );*/
      const WoList();
  }
}
