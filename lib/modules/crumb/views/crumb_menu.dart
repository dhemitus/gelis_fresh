import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';

class CrumbMenu extends StatelessWidget {
  final String? code;
  const CrumbMenu({Key? key, this.code = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CrumbBloc>().add(GetCrumbEvent());
    List<Widget> menu(List<CrumbItem> m, CrumbItem c) {
      List<Widget> l = [];
      //int i = 0;
      m.map((CrumbItem e) {
        l.add(CrumbButton(
          text: e.label,
          icon: e.icon,
          activeIcon: e.activeIcon,
          active: e.route == c.route,
          onTap: () => context.read<CrumbBloc>().add(SetCrumbEvent(e)),
        ));
        /*if(i < m.length - 1) {
          l.add(chevronRight);
        }
        i++;*/
      }).toList();
      return l;
    }
    return BlocBuilder<CrumbBloc, CrumbState>(
      buildWhen: (previous, current) => previous.crumb != current.crumb,
      builder: (BuildContext context, CrumbState state){

        return CrumbHeader(
          back: true,
          label: code,
          onBack: () => context.read<NavigationBloc>().add(const OnBack()),
          items: menu(state.menu, state.crumb), 
        );
      }
    );
  }
}
