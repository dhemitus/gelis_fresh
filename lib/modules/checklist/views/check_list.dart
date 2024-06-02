import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CheckList extends StatelessWidget {
  final PagingController<int, WoModel> pagingController;
  const CheckList({Key? key, required this.pagingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    pagingController.addPageRequestListener((pageKey) {

      WoMetaModel m = context.read<CheckListBloc>().state.meta.copyWith(skip: pageKey);
      context.read<CheckListBloc>().add(GetCheckMetaEvent(m));
      context.read<CheckListBloc>().add(GetCheckListEvent());
    });

    Future<void> onRefresh() async {
      pagingController.refresh();
    }

    void oncancel() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    void onOpen(WoModel w) {
        showModalBottomSheet(
        context: context, 
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        builder: (BuildContext c) => OnGoingConfirmForm(
          onCancel:  oncancel,
          onConfirm: () {
            context.read<TransferBloc>().add(TransferChangeEvent(5, w));
            context.read<NavigationBloc>().add(const OnBack());
          },
        )
      );
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

          return CheckListWoCard(
            onCard: () {
              context.read<PrintBloc>().add(GetPrintDataEvent(item.woNo!));
              context.read<NavigationBloc>().add(const OnGo(path: PrintRoute.path));
            },
            onTap: () => onOpen.call(l[index]),
            serial: item.woNo,
            title: item.jenisPengukuran,
            company: item.perusahaanNama,
            contact: item.namaCp,
            location: item.lokasi,
            locate: '${item.sample!.length} titik',
            type: wotype,
          );
        }
      );
    }

    Widget switchIt(CheckListStatus e, List<WoModel> l) {
      switch(e) {
        case CheckListStatus.loading:
          return const LoadingContainer();
        case CheckListStatus.failure:
          return const EmptyTextContainer();
        case CheckListStatus.success:
          return l.isNotEmpty ? list(l) : const EmptyTextContainer();
        default:
          return Container();

      }
    }
    
    return BlocBuilder<CheckListBloc, CheckListState>(
      buildWhen: (previous, current) => previous.status != current.status && previous.list != current.list,
      builder: (BuildContext context, CheckListState state) {
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
