import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class DataList extends StatelessWidget {
  final PagingController<int, WoModel> pagingController;
  const DataList({Key? key, required this.pagingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    pagingController.addPageRequestListener((pageKey) {

      WoMetaModel m = context.read<DataListBloc>().state.meta.copyWith(skip: pageKey);
      context.read<DataListBloc>().add(GetDataMetaEvent(m));
      context.read<DataListBloc>().add(GetDataListEvent());
    });

    Future<void> onRefresh() async {
      pagingController.refresh();
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

      } else if(w.status!.kode == 5) {
        context.read<OnGoingListBloc>().add(SetOnGoingDetailEvent(w));
        context.read<WoDetailBloc>().add(GetWoDetailEvent(w.no));
        context.read<NavigationBloc>().add(const OnGo(path: WoDetailRoute.path));
      }
    }

    Widget list(List<WoModel> l) {
      return RefreshPageList<WoModel>(
        pagingController: pagingController,
        items: l,
        onRefresh: onRefresh,
        builder: (BuildContext context, WoModel item, int index) {
          var wotype = 'air';
          if(item.sample != null && item.sample!.isNotEmpty) {
            wotype = item.sample![0].jenisPengukuranGroupId == 1 ? 'water' : 'air';
          }

          switch (item.status!.kode) {
            case 2:
              return ApproveWoCard(
                onTap: () => onOpen.call(item),
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(item.woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                serial: item.woNo,
                title: item.jenisPengukuran,
                company: item.perusahaanNama,
                contact: item.namaCp,
                location: item.lokasi,
                locate: '${item.sample!.length} titik',
                type: wotype,
              );  
            case 4:
              return CheckListWoCard(
                onTap: () => onOpen.call(item),
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(item.woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                serial: item.woNo,
                title: item.jenisPengukuran,
                company: item.perusahaanNama,
                contact: item.namaCp,
                location: item.lokasi,
                locate: '${item.sample!.length} titik',
                type: wotype,
              );
            case 5:
              return OnGoingWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(item.woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                onTap: () => onOpen.call(item),
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
                serial: item.woNo,
                title: item.jenisPengukuran,
                company: item.perusahaanNama,
                contact: item.namaCp,
                location: item.lokasi,
                locate: '${item.sample!.length} titik',
                type: wotype,
              );     
            case 6:
              return RevisionWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(item.woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                serial: item.woNo,
                title: item.jenisPengukuran,
                company: item.perusahaanNama,
                contact: item.namaCp,
                location: item.lokasi,
                locate: '${item.sample!.length} titik',
                type: wotype,
              );
            case 7: 
              return RevisedWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(item.woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                serial: item.woNo,
                title: item.jenisPengukuran,
                company: item.perusahaanNama,
                contact: item.namaCp,
                location: item.lokasi,
                locate: '${item.sample!.length} titik',
                type: wotype,
              );
            case 8:
              return ReportWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(item.woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                serial: item.woNo,
                title: item.jenisPengukuran,
                company: item.perusahaanNama,
                contact: item.namaCp,
                location: item.lokasi,
                locate: '${item.sample!.length} titik',
                type: wotype,
              );
            default:
              return CheckListWoCard(
                onCard: () {
                  context.read<PrintBloc>().add(GetPrintDataEvent(item.woNo!));
                  context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
                },
                onTap: () => onOpen.call(item),
                serial: item.woNo,
                title: item.jenisPengukuran,
                company: item.perusahaanNama,
                contact: item.namaCp,
                location: item.lokasi,
                locate: '${item.sample!.length} titik',
                type: wotype,
              );     
          }
        }
      );
    }

    Widget switchIt(DataListStatus e, List<WoModel> l) {
      switch(e) {
        case DataListStatus.loading:
          return const LoadingContainer();
        case DataListStatus.failure:
          return const EmptyTextContainer();
        case DataListStatus.success:
          return l.isNotEmpty ? list(l) : const EmptyTextContainer();
        default:
          return Container();

      }
    }
    
    return BlocBuilder<DataListBloc, DataListState>(
      buildWhen: (previous, current) => previous.status != current.status && previous.list != current.list,
      builder: (BuildContext context, DataListState state) {
        if(state.list.length < state.meta.limit!) {
          pagingController.appendLastPage(state.list);
        } else {
          pagingController.appendPage(state.list, state.meta.skip! + state.meta.limit!);
        }
        return switchIt(state.status, state.list);     
      }
    );

  }
}
