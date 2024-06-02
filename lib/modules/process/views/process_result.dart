import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ProcessResult extends StatelessWidget {
  const ProcessResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: '');
    void send(String t) {
      context.read<ProcessBloc>().add(SetProcessResultEvent(t));
    }
    return BlocConsumer<ProcessBloc, ProcessState>(
      listener: (BuildContext context, ProcessState state){
        controller.text = state.result;
        if(state.status == ProcessStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('update sukses')));
 
        }
      },
      builder: (BuildContext context, ProcessState state) {
        return ProcessInputForm(
          label: state.plate,
          member: WoMemberList(
            value: state.member,
            onChange: (s) => context.read<ProcessBloc>().add(SetProcessMemberEvent(s))
          ),
          done: LabelCheckbox(
            label: 'Status Pengambilan Sample Selesai',
            value: state.done,
            onChange: (b) => context.read<ProcessBloc>().add(SetProcessDoneEvent(b)),
          ),
          result: ButtonInputText(
            controller: controller,
            label: 'Waktu Sampling',
            onTap: () async {
              var t = await showTimePicker(context: context, initialTime:TimeOfDay.now());
              if(t != null) {
                send('${t.hour}:${t.minute}');
              }
            },
            value: state.result,
            suffix: clock,
          ),
          note: LabelInputText(
            label: 'Catatan',
            line: 3,
            onChange: (String s) => context.read<ProcessBloc>().add(SetProcessNoteEvent(s)),
          ),
          button: PrimaryButton(
            text: 'Simpan Data',
            onTap: () {
              List<WoTestParameterModel> p = context.read<SamplingBloc>().state.sample.bakumutuParamuji!;
              String d = '${TimeUtilities.now()} ${state.result}'; 

              ProcessModel m = ProcessModel(
                testparam: p,
                member: state.member,
                note: state.note,
                plate: state.plate,
                result: d,
                done: state.done,
                id: context.read<SamplingBloc>().state.sample.id
              );
              context.read<ProcessBloc>().add(SetProcessEvent(m));
            },
          ),
        );
      }
    );
  }
}
