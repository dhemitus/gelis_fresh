import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SamplingProcess extends StatelessWidget {
  const SamplingProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SamplingBloc, SamplingState>(
      builder: (BuildContext context,  state) {
        String h = '';
        state.sample.bakumutuParamuji!.map((e) => h += '${e.parameteruji}, '  ).toList();

        return ProcessForm(
          process: ButtonInputText(
            label: state.sample.bakumutuParamuji![0].kodeWadahSample ?? '',
            hint: h,
            onTap: () {
              WoMemberModel m = context.read<WoDetailBloc>().state.wo.anggota![0];

              context.read<ProcessBloc>().add(SetProcessMemberEvent(m));
              context.read<ProcessBloc>().add(SetProcessPlateEvent(state.sample.bakumutuParamuji![0].kodeWadahSample ?? ''));
              context.read<NavigationBloc>().add(const OnGo(path: ProcessRoute.path));
            }
          ),
        );
      }
    );
  }
}
