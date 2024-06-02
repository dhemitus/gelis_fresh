import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class OnGoingList extends StatelessWidget {
  final PagingController<int, WoModel> pagingController;
  const OnGoingList({Key? key, required this.pagingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    pagingController.addPageRequestListener((pageKey) {

      WoMetaModel m = context.read<OnGoingListBloc>().state.meta.copyWith(skip: pageKey);
      context.read<OnGoingListBloc>().add(GetOnGoingMetaEvent(m));
      context.read<OnGoingListBloc>().add(GetOnGoingListEvent());
    });

    Future<void> onRefresh() async {
      pagingController.refresh();
    }

    void onGo(WoModel w) {
      context.read<OnGoingListBloc>().add(SetOnGoingDetailEvent(w));
      context.read<WoDetailBloc>().add(GetWoDetailEvent(w.no));
      context.read<NavigationBloc>().add(const OnGo(path: WoDetailRoute.path));
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

          return OnGoingWoCard(
            serial: item.woNo,
            title: item.jenisPengukuran,
            company: item.perusahaanNama,
            contact: item.namaCp,
            location: item.lokasi,
            locate: '${item.sample!.length} titik',
            type: wotype,
            onTap: () => onGo.call(item),
            onCard: () {
              context.read<PrintBloc>().add(GetPrintDataEvent(item.woNo!));
              context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
            },
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
                        context.read<TransferBloc>().add(TransferChangeEvent(6, item));
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
                        context.read<TransferBloc>().add(TransferChangeEvent(8, item));
                        context.read<NavigationBloc>().add(const OnBack());
                      },
                    );
                  }
                );
              }
            },
          );
        }
      );
    }

    Widget switchIt(OnGoingListStatus e, List<WoModel> l) {
      switch(e) {
        case OnGoingListStatus.loading:
          return const LoadingContainer();
        case OnGoingListStatus.failure:
          return const EmptyTextContainer();
        case OnGoingListStatus.success:
          return l.isNotEmpty ? list(l) : const EmptyTextContainer();
        default:
          return Container();

      }
    }
    
    return BlocBuilder<OnGoingListBloc, OnGoingListState>(
      buildWhen: (previous, current) => previous.status != current.status && previous.list != current.list,
      builder: (BuildContext context, OnGoingListState state) {
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
