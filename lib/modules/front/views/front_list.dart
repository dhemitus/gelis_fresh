import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class FrontList extends StatelessWidget {
  const FrontList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     context.read<FrontBloc>().add(GetFrontListEvent());

   
    Future<void> onRefresh() async {
     context.read<FrontBloc>().add(GetFrontListEvent());
    }

    void onOpen(WoModel w) {
      if(w.status!.kode == 4) {
        showModalBottomSheet(
          context: context, 
          backgroundColor: Colors.transparent,
          useRootNavigator: true,
          builder: (BuildContext c) => OnGoingConfirmForm(
            onCancel: () => context.read<NavigationBloc>().add(const OnBack()),
            onConfirm: () {
              context.read<TransferBloc>().add(TransferChangeEvent(5, w));
              context.read<NavigationBloc>().add(const OnBack());
            },
          )
        );

      } else if(w.status!.kode == 2) {
        context.read<OnGoingListBloc>().add(SetOnGoingDetailEvent(w));
        context.read<WoDetailBloc>().add(GetWoDetailEvent(w.no));
        context.read<NavigationBloc>().add(const OnGo(path: WoDetailRoute.path));
      }
    }

    Widget list(List<WoModel> l) {

      return RefreshList<WoModel>(
        items: l,
        onRefresh: onRefresh,
        builder: (BuildContext context, int index) {
          var wotype = 'air';
          if(l[index].sample != null && l[index].sample!.isNotEmpty) {
            wotype = l[index].sample![0].jenisPengukuranGroupId == 1 ? 'water' : 'air';
          }

          switch(l[index].status!.kode) {
            case 2:
              return ApproveWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(l[index].woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                onTap: () => onOpen.call(l[index]),
                serial: l[index].woNo,
                title: l[index].jenisPengukuran,
                company: l[index].perusahaanNama,
                contact: l[index].namaCp,
                location: l[index].lokasi,
                locate: '${l[index].sample!.length} titik',
                type: wotype,
              );  
            case 4:
              return CheckListWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(l[index].woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                onTap: () => onOpen.call(l[index]),
                serial: l[index].woNo,
                title: l[index].jenisPengukuran,
                company: l[index].perusahaanNama,
                contact: l[index].namaCp,
                location: l[index].lokasi,
                locate: '${l[index].sample!.length} titik',
                type: wotype,
              );
            case 5:
              return OnGoingWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(l[index].woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                onTap: () => onOpen.call(l[index]),
                onItem: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 6,
                    child: Title2Text('Revisi'),
                  ),
                  const PopupMenuItem(
                    value: 8,
                    child: Title2Text('Berita Acara'),
                  ),
                ],
                onSelect: (a) {
                  if(a == 6) {
                    showDialog(
                      context: context,
                      useRootNavigator: true,
                      builder: (BuildContext context) {
                        return RevisionDialogCard(
                          onCancel: () => context.read<NavigationBloc>().add(const OnBack()),
                          onSave: () {
                            context.read<TransferBloc>().add(TransferChangeEvent(6, l[index]));
                            context.read<NavigationBloc>().add(const OnBack());
                          },
                        );
                      }
                    );
                  } else {
                    showDialog(
                      context: context,
                      useRootNavigator: true,
                      builder: (BuildContext context) {
                        return ReportDialogCard(
                          onCancel: () => context.read<NavigationBloc>().add(const OnBack()),
                          onSave: () {
                            context.read<TransferBloc>().add(TransferChangeEvent(8, l[index]));
                            context.read<NavigationBloc>().add(const OnBack());
                          },
                        );
                      }
                    );
                  }
                },
                serial: l[index].woNo,
                title: l[index].jenisPengukuran,
                company: l[index].perusahaanNama,
                contact: l[index].namaCp,
                location: l[index].lokasi,
                locate: '${l[index].sample!.length} titik',
                type: wotype,
              );     
            case 6:
              return RevisionWoCard(
                serial: l[index].woNo,
                title: l[index].jenisPengukuran,
                company: l[index].perusahaanNama,
                contact: l[index].namaCp,
                location: l[index].lokasi,
                locate: '${l[index].sample!.length} titik',
                type: wotype,
              );
            case 7:
              return RevisedWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(l[index].woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                serial: l[index].woNo,
                title: l[index].jenisPengukuran,
                company: l[index].perusahaanNama,
                contact: l[index].namaCp,
                location: l[index].lokasi,
                locate: '${l[index].sample!.length} titik',
                type: wotype,
              );
            case 8:
              return ReportWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(l[index].woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                serial: l[index].woNo,
                title: l[index].jenisPengukuran,
                company: l[index].perusahaanNama,
                contact: l[index].namaCp,
                location: l[index].lokasi,
                locate: '${l[index].sample!.length} titik',
                type: wotype,
              );
            default:
              return CheckListWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(l[index].woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                onTap: () => onOpen.call(l[index]),
                serial: l[index].woNo,
                title: l[index].jenisPengukuran,
                company: l[index].perusahaanNama,
                contact: l[index].namaCp,
                location: l[index].lokasi,
                locate: '${l[index].sample!.length} titik',
                type: wotype,
              );     
/*            case 'approve':
              return ApproveWoCard(
                onTap: () => onOpen.call(l[index]),
                serial: l[index].serial,
                title: l[index].title,
                company: '${l[index].company}  ${TimeUtilities.now()}',
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
*/
          }

          /*if(l[index].status == 'approve') {
                        } else if() {

          } else {
                      }*/
          
        }
      );
    }

    Widget switchIt(FrontListStatus e, List<WoModel> l) {
      switch(e) {
        case FrontListStatus.loading:
          return const LoadingContainer();
        case FrontListStatus.failure:
          return const EmptyContainer();
        case FrontListStatus.success:
          return l.isNotEmpty ? list(l) : const EmptyContainer();
        default:
          return Container(
          );
      } 
    }

    return BlocBuilder<FrontBloc, FrontListState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (BuildContext context, FrontListState state) {
        return switchIt(state.status, state.list);
      }
    );
  }
}
