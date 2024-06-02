import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SamplingNtu extends StatelessWidget {
  const SamplingNtu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SamplingBloc, SamplingState>(
      builder: (BuildContext context, SamplingState state){
        List<Widget> l = [];
        if(state.sample.bakumutuParamuji!.isNotEmpty) {
          state.sample.bakumutuParamuji!.map((e) {
            l.add(
              ButtonInputText(
                label: e.parameteruji,
                hint: e.parameteruji,
                suffix: ntu,
                onTap: () {
                  WoMemberModel m = context.read<WoDetailBloc>().state.wo.anggota![0];

                  context.read<FieldBloc>().add(SetFieldMemberEvent(m));
                  context.read<FieldBloc>().add(SetFieldDetailEvent(e));
                  context.read<NavigationBloc>().add(const OnGo(path: FieldRoute.path));
                },
              )
            );
          } ).toList();
        }
        return FieldForm(
          label: 'Parameter ${state.sample.bakumutuParamuji![0].dataTaken}',
          inputs: l,
        );
      }
    );
  }
}
