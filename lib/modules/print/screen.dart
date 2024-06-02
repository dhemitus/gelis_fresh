import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class PrintScreen extends StatelessWidget {
  const PrintScreen({Key? key}) : super(key: PrintRoute.key);

  @override
  Widget build(BuildContext context) {
    return PrintPage(
      head: SimpleTitleHeader(
        back: true,
        onBack: () => context.read<NavigationBloc>().add(const OnBack()),
      ),
      child: const PrintResult(),
    );
  }
}
