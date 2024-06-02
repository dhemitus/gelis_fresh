import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';

class SamplingDetail extends StatelessWidget {
  const SamplingDetail({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SamplingBloc, SamplingState>(
      builder: (BuildContext context, SamplingState state) {
        List<Widget> l = [];
        if(state.sample.bakumutuParampendukung != null && state.sample.bakumutuParampendukung!.isNotEmpty) {
          state.sample.bakumutuParampendukung!.map((e) {
            Widget s = Container();
            if(e.satuan == 'ºC') {
              s = c;
            } else if(e.satuan == '%RH') {
                s = rh;
            }
            l.add(
              ButtonInputText(
                label: e.parameterPendukung ?? '', 
                hint: e.parameterPendukung ??  '',
                suffix: s,
                onTap: () {
                  WoMemberModel m = context.read<WoDetailBloc>().state.wo.anggota![0];

                  context.read<SupportBloc>().add(SetSupportMemberEvent(m));
                  context.read<SupportBloc>().add(SetSupportDetailEvent(e));
                  context.read<NavigationBloc>().add(const OnGo(path: SupportRoute.path));
                },
              )
            );
          } 
          ).toList();
        }

        return ConditionForm(
          map: const PreviewMap(),
          inputs: l,
          browse: const ImageBrowse(),
          button: const ImageSubmit(),
        );

      }
    );
  }
}
