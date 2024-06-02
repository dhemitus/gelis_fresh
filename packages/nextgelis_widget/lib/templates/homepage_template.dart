import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class HomePage extends StatelessWidget {
  final Widget? child;
  final List<Widget> screens;
  final Function(int)? onSelect;

  const HomePage({Key? key, this.child, required this.screens, this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child ?? Container(),
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: BottomTab(screens: screens, onSelect: onSelect,),
    );
  }
}
