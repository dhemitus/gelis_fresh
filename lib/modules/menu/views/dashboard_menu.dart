import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class DashboardMenu extends StatelessWidget {
  const DashboardMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<MenuBloc>().add(GetMenuListEvent());


    void onTap(String s) {
      if(s.isNotEmpty) {
        switch(s) {
          case ApproveRoute.path:
            context.read<ApproveWoListBloc>().add(GetApproveWoInitEvent());
            context.read<ApproveWoListBloc>().add(GetApproveWoListEvent());
            break;
          case CheckRoute.path:
            context.read<CheckListBloc>().add(GetCheckInitEvent());
            context.read<CheckListBloc>().add(GetCheckListEvent());
            break;
          case OnGoingRoute.path:
            context.read<OnGoingListBloc>().add(GetOnGoingInitEvent());
            context.read<OnGoingListBloc>().add(GetOnGoingListEvent());
            break;
          case RevisionRoute.path:
            context.read<RevisionListBloc>().add(GetRevisionInitEvent());
            context.read<RevisionListBloc>().add(GetRevisionListEvent());
            break;
          case RevisedRoute.path:
            context.read<RevisedListBloc>().add(GetRevisedInitEvent());
            context.read<RevisedListBloc>().add(GetRevisedListEvent());
            break;
          case ReportRoute.path:
            context.read<ReportListBloc>().add(GetReportInitEvent());
            context.read<ReportListBloc>().add(GetReportListEvent());
            break;
          case CalendarRoute.path:
            context.read<CalendarBloc>().add(GetCalendarDateEvent(TimeUtilities.now()));
            context.read<CalendarBloc>().add(GetCalendarListEvent());
            break;
        }
        context.read<NavigationBloc>().add(OnGo(path: s));
      }
    }

    List<Widget> list(MenuStatus e, List<DsItem> l) {
      List<Widget> m = [];
      switch(e) {
        case MenuStatus.loading:
          return [];
        case MenuStatus.failure:
          return [];
        case MenuStatus.success:
          l.map((DsItem e) => m.add(
            BoardButton(text: e.label, icon: e.icon, onTap:() => onTap(e.route!),)
          )).toList();
          return m;
        default:
          return [];
      }
    }

    return BlocBuilder<MenuBloc, MenuState>(
      buildWhen: (previous, current) => previous.menu != current.menu,
      builder: (BuildContext context, MenuState state){
      return MenuCard(list:list(state.status, state.menu));
    });
  }
}
