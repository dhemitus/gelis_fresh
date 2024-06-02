import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SupportResult extends StatelessWidget {
  const SupportResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: '');

    void send(String t) {
      context.read<SupportBloc>().add(SetSupportTimeEvent(t));
    }

    return BlocConsumer<SupportBloc, SupportState>(
      builder: (BuildContext context, SupportState state){
        Widget s = Container();
        if(state.detail.satuan == 'ºC') {
          s = c;
        } else if(state.detail.satuan == '%RH') {
            s = rh;
        }
        return SupportInputForm(
          label: state.detail.parameterPendukung ?? '',
          result: LabelInputText(
            label: 'Nilai Hasil',
            onChange: (String s) => context.read<SupportBloc>().add(SetSupportResultEvent(s)),
            suffix: SuffixContainer(icon: s),
          ),
          time: ButtonInputText(
            controller: controller,
            label: 'Waktu Pengukuran',
            onTap: () async {
              var t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              if(t != null) {
                send('${t.hour}:${t.minute}');
              }
            },
            value: state.time,
            suffix: clock,
          ),
          member: WoMemberList(
            value: state.member,
            onChange: (s) => context.read<SupportBloc>().add(SetSupportMemberEvent(s)),
          ),
          button: PrimaryButton(
            text: 'Simpan Data',
            onTap: () {
              String d = '${TimeUtilities.now()} ${state.time}';

              SupportModel m = SupportModel(
                member: state.member,
                time: d,
                result: state.result,
                id: state.detail.id
              );
              context.read<SupportBloc>().add(SetSupportEvent(m));
            },
          ),
        );
      }, listener: (BuildContext context, SupportState state){
        controller.text = state.time;
        if(state.status == SupportStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('update sukses')));
 
        }
      }
    );
  }
}
