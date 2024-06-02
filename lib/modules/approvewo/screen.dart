import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ApproveWoScreen extends StatelessWidget {
  const ApproveWoScreen({Key? key}) : super(key: ApproveRoute.key);
//final log = Logger();


  @override
  Widget build(BuildContext context) {

    final PagingController<int, WoModel> pagingController = PagingController(firstPageKey: 0);  
    pagingController.addPageRequestListener((pageKey) {

      WoMetaModel m = context.read<ApproveWoListBloc>().state.meta.copyWith(skip: pageKey);
      context.read<ApproveWoListBloc>().add(GetApproveWoMetaEvent(m));
      context.read<ApproveWoListBloc>().add(GetApproveWoListEvent());
    });
    
    void back() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    void onsearch() {
      print('-----------------');
      print('search');
      print('-----------------');
      pagingController.refresh();
      //context.read<ApproveWoListBloc>().add(GetApproveWoListEvent());
    }

    void onsubmit(String s) {
      print('-----------------');
      print('submit $s');
      print('-----------------');
      //context.read<ApproveWoListBloc>().add(GetApproveWoSearchEvent(s));
      pagingController.refresh();
      context.read<ApproveWoListBloc>().add(GetApproveWoListEvent());
    }

    return ApprovePage(
      head: TitleHeader(
        label: 'Approve WO', 
        onSearch: onsearch,
        onSubmit: onsubmit,
        onChange: (String a) => context.read<ApproveWoListBloc>().add(GetApproveWoSearchEvent(a)),
        back: true,
        onBack: back,
      ),
      child: ApproveWoList(pagingController: pagingController,),
    );
  }
}
