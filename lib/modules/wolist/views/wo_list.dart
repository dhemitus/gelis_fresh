import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class WoList extends StatelessWidget {
  const WoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future<void> onRefresh() async {
      context.read<WoListBloc>().add(GetWoListEvent());
    }

    void onOpen(WoItem w) {
      if(w.status == 'checklist') {
        showModalBottomSheet(
          context: context, 
          backgroundColor: Colors.transparent,
          useRootNavigator: true,
          builder: (BuildContext c) => OnGoingConfirmForm(
            onCancel: () => context.read<NavigationBloc>().add(const OnBack()),
          )
        );

      } else if(w.status == 'ongoing') {
        //context.read<OnGoingListBloc>().add(SetOnGoingDetailEvent(w));
        //context.read<WoDetailBloc>().add(GetWoDetailListEvent());
        //context.read<NavigationBloc>().add(const OnGo(path: WoDetailRoute.path));
      }
    }

    Widget list(List<WoItem> l) {
      return RefreshList<WoItem>(
        items: l,
        onRefresh: onRefresh,
        builder: (BuildContext context, int index) {
          switch(l[index].status) {
            case 'approve':
              return ApproveWoCard(
                onTap: () => onOpen.call(l[index]),
                serial: l[index].serial,
                title: l[index].title,
                company: l[index].company,
                contact: l[index].contact,
                location: l[index].location,
                locate: l[index].locate,
                type: l[index].type,
              );
            case 'ongoing':
              return OnGoingWoCard(
                onTap: () => onOpen.call(l[index]),
                onDesc: () => {
                  showDialog(
                    context: context,
                    useRootNavigator: true,
                    builder: (BuildContext context) {
                      return RevisionDialogCard(
                        onCancel: () => context.read<NavigationBloc>().add(const OnBack()),

                      );
                    }
                  )
                },
                serial: l[index].serial,
                title: l[index].title,
                company: l[index].company,
                contact: l[index].contact,
                location: l[index].location,
                locate: l[index].locate,
                type: l[index].type,
              );
            case 'checklist':
              return CheckListWoCard(
                onTap: () => onOpen.call(l[index]),
                serial: l[index].serial,
                title: l[index].title,
                company: l[index].company,
                contact: l[index].contact,
                location: l[index].location,
                locate: l[index].locate,
                type: l[index].type,
              );
            default:
              return CheckListWoCard(
                onTap: () => onOpen.call(l[index]),
                serial: l[index].serial,
                title: l[index].title,
                company: l[index].company,
                contact: l[index].contact,
                location: l[index].location,
                locate: l[index].locate,
                type: l[index].type,
              );

          }

          /*if(l[index].status == 'approve') {
                        } else if() {

          } else {
                      }*/
          
        }
      );
    }

    Widget switchIt(WoListStatus e, List<WoItem> l) {
      switch(e) {
        case WoListStatus.loading:
          return Container();
        case WoListStatus.failure:
          return Container();
        case WoListStatus.success:
          return list(l);
        default:
          return Container();
      }
    }

    return BlocBuilder<WoListBloc, WoListState>(
      buildWhen: (previous, current) => previous.list != current.list,
      builder: (BuildContext context, WoListState state) {
        return WoListPage(
          label: 'Active Work Order',
          head: const TopMainHeader(),
          menu: const DashboardMenu(),
          calendar: const CalendarLineContainer(),
          list: switchIt(state.status, state.list),
          /*child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const MenuCard(),
              const CalendarLineContainer(),
              Expanded(
                child: switchIt(state.status, state.list)
              )
            ]
          ),*/
        );
      }
    );
  }
}
