import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class HistoryList extends StatelessWidget {
  final PagingController<int, WoModel> pagingController;
  const HistoryList({Key? key, required this.pagingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {   
    pagingController.addPageRequestListener((pageKey) {

      WoMetaModel m = context.read<HistoryListBloc>().state.meta.copyWith(skip: pageKey);
      context.read<HistoryListBloc>().add(GetHistoryMetaEvent(m));
      context.read<HistoryListBloc>().add(GetHistoryListEvent());
    });

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
          int u = MathUtilities.range(10, 19);

          return HistoryWoCard(
            serial: item.woNo,
            title: item.jenisPengukuran,
            company: item.perusahaanNama,
            contact: item.namaCp,
            location: item.lokasi,
            locate: '${item.sample!.length} titik',
            type: wotype,
            picture: 'https://picsum.photos/id/$u/300/300',
            status: 'selesai', // selesai | dibatalkan
            date: item.tanggalRencanaSampai != null ? TimeUtilities.toDate(item.tanggalRencanaSampai!) : '',
          );
        }
      );
    }

    Widget switchIt(HistoryListStatus e, List<WoModel> l) {
      switch(e) {
        case HistoryListStatus.loading:
          return const LoadingContainer();
        case HistoryListStatus.failure:
          return const EmptyTextContainer();
        case HistoryListStatus.success:
          return l.isNotEmpty ? list(l) : const EmptyTextContainer();
        default:
          return Container();
      }
    }
    
    return BlocBuilder<HistoryListBloc, HistoryListState>(
      buildWhen: (previous, current) => previous.status != current.status && previous.list != current.list,
      builder: (BuildContext context, HistoryListState state) {
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
