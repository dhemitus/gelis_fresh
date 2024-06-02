import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({Key? key}) : super(key: FrontRoute.key);

  @override
  Widget build(BuildContext context) {
    context.read<FrontBloc>().add(GetFrontDateEvent(TimeUtilities.now()));

    return WoListPage(
      label: 'Active Work Order',
      head: const TopMainHeader(),
      menu: const DashboardMenu(),
      calendar: WeekTimeline(
        onSelect: (DateTime s) {

          context.read<FrontBloc>().add(GetFrontDateEvent(TimeUtilities.toSimpleString(s)));
          context.read<FrontBloc>().add(GetFrontListEvent());
          debugPrint('on select');
          debugPrint(s.toString());
        },
      ),
      list: const FrontList(),
    );
  }
}
