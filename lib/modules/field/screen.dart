import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class FieldScreen extends StatelessWidget {
  const FieldScreen({Key? key}) : super(key: FieldRoute.key);

  @override
  Widget build(BuildContext context) {
    return FieldPage(
      head: SimpleTitleHeader(
        back: true,
        onBack: () => context.read<NavigationBloc>().add(const OnBack()),
      ),
      child: const FieldResult(),
    );
  }
}
