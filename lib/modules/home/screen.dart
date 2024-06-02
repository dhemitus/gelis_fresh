import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final log = Logger();
  List<Widget> _buildScreens() {
    return [
      const FrontScreen(),
      DataScreen(),
      Container(
        color: Colors.blueGrey,
      ),
      HistoryScreen(),
      const UserScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {

    void onSelect(int i) {
      switch(i) {
        case 1:
          context.read<DataListBloc>().add(GetDataInitEvent());
          context.read<DataListBloc>().add(GetDataListEvent());
          break;
        case 3:
          context.read<HistoryListBloc>().add(GetHistoryInitEvent());
          context.read<HistoryListBloc>().add(GetHistoryListEvent());
          break;
      }
    }

    return HomePage(screens: _buildScreens(), onSelect: onSelect, child: _buildScreens().first);
  }
}
