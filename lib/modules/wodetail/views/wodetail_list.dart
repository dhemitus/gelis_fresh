import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class WoDetailList extends StatelessWidget {
  const WoDetailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void onGo(WoSampleModel i) {
      context.read<NavigationBloc>().add(const OnGo(path: SamplingRoute.path));
      context.read<SamplingBloc>().add(GetSamplingDetailEvent(i.id!));
    }

    Widget list(WoDetailModel l) {
      List<WoSampleModel> s = []; 
      if(l.sample != null && l.sample!.isNotEmpty) {
        s = l.sample!;
      }
      return StaticList<WoSampleModel>(
          items: s,
          space: true,
          builder: (BuildContext context, int index) {
            var wotype = 'air';
            wotype = s[index].jenisPengukuranGroupId == 1 ? 'water' : 'air';
            
            return DetailWoCard(
              onTap: () => onGo.call(s[index]),
              serial: s[index].kodeSample,
              title: s[index].jenisPengukuran,
              company: s[index].perusahaanNama,
              location: s[index].hasilLokasi,
              contact: s[index].samplingMetodeNama,
              locate: s[index].bakumutu,
              type: wotype,
            );
          }
      );
    }

    Widget switchIt(WoDetailStatus e, WoDetailModel l) {
      switch(e) {
        case WoDetailStatus.loading:
          return const LoadingContainer();
        case WoDetailStatus.failure:
          return const EmptyTextContainer();
        case WoDetailStatus.success:
          return list(l);
        default:
          return Container();
      }
    }

    void back() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    return BlocBuilder<WoDetailBloc, WoDetailState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (BuildContext context, WoDetailState state) {
        return WoDetailPage(
          head: SimpleTitleHeader(
            back: true,
            onBack: back,
            label: context.select((OnGoingListBloc bloc) => bloc.state.wo.woNo) ?? ''
          ),
          child: switchIt(state.status, state.wo),
        );
      }
    );
  }
}
