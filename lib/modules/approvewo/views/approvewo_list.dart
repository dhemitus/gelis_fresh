import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ApproveWoList extends StatelessWidget {
  final PagingController<int, WoModel> pagingController;
  const ApproveWoList({Key? key, required this.pagingController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    /*pagingController.addPageRequestListener((pageKey) {

      WoMetaModel m = context.read<ApproveWoListBloc>().state.meta.copyWith(skip: pageKey);
      context.read<ApproveWoListBloc>().add(GetApproveWoMetaEvent(m));
      context.read<ApproveWoListBloc>().add(GetApproveWoListEvent());
    });*/

    Future<void> onRefresh() async {
      pagingController.refresh();
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
          return ApproveWoCard(
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
        }
      );
    }

    Widget switchIt(ApproveWoListStatus e, List<WoModel> l) {
      switch(e) {
        case ApproveWoListStatus.loading:
          return const LoadingContainer();
        case ApproveWoListStatus.failure:
          return const EmptyTextContainer();
        case ApproveWoListStatus.success:
          return l.isNotEmpty ? list(l) : const EmptyTextContainer();
        default:
          return Container();

      }
    }

   return BlocBuilder<ApproveWoListBloc, ApproveWoListState>(
      buildWhen: (previous, current) => previous.list != current.list,
      builder: (BuildContext context, ApproveWoListState state) {
        /*if(state.list.length < state.meta.limit!) {
          pagingController.appendLastPage(state.list);
        } else {
          pagingController.appendPage(state.list, state.meta.skip! + state.meta.limit!);
        }*/
        print(state.list);
        return switchIt(state.status, state.list);
      }
    );
  }

}
