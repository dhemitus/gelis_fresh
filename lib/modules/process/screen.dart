import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({Key? key}) : super(key: ProcessRoute.key);

  @override
  Widget build(BuildContext context) {
    return ProcessPage(
      head: SimpleTitleHeader(
        back: true,
        onBack: () => context.read<NavigationBloc>().add(const OnBack()),
      ),
      child: const ProcessResult()
    );
  }
}
