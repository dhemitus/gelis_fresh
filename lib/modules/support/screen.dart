import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SupprtScreen extends StatelessWidget {
  const SupprtScreen({Key? key}) : super(key: SupportRoute.key);

  @override
  Widget build(BuildContext context) {
    return SupportPage(
      head: SimpleTitleHeader(
        back: true,
        onBack: () => context.read<NavigationBloc>().add(const OnBack()),
      ),
      child: const SupportResult(),
    );
  }
}
