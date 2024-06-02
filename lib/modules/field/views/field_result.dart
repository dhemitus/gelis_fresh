import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class FieldResult extends StatelessWidget {
  const FieldResult({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstcontroller = TextEditingController(text: '');
    TextEditingController lastcontroller = TextEditingController(text: '');

    void sendfirst(String t) {
      context.read<FieldBloc>().add(SetFieldFirstEvent(t));
    }

    void sendlast(String t) {
      context.read<FieldBloc>().add(SetFieldLastEvent(t));
    }

    return BlocConsumer<FieldBloc, FieldState>(
      listener: (BuildContext context, FieldState state){
        firstcontroller.text = state.first;
        lastcontroller.text = state.last;
        if(state.status == FieldStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('update sukses')));
        }

      },
      builder: (BuildContext context, FieldState state){
        return FieldInputForm(
          label: 'Parameter Pengujian Lapangan',
          title: 'Parameter Uji ${state.detail.parameteruji}',
          subtitle: 'Metoda ${state.detail.metoda}',
          endtitle: 'Kode Wadah\n${state.detail.kodeWadahSample}',
          test: LabelInputText(
            label: 'Pengujian',
            onChange: (s) => context.read<FieldBloc>().add(SetFieldTestEvent(s)),
          ),
          range: LabelCheckbox(
            label: 'Pengukuran Rentang Waktu',
            value: state.range == 1 ? true : false,
            onChange: (b) => context.read<FieldBloc>().add(SetFieldRangeEvent(b ? 1 : 0)),
          ),
          quality: LabelSwitch(
            label: 'Hasil Kualitatif',
            value: state.quality == 1 ? true : false,
            onChange: (b) => context.read<FieldBloc>().add(SetFieldQualityEvent(b ? 1 : 0)),
          ),
          simplo: LabelInputText(
            label: 'Simplo',
            onChange: (s) => context.read<FieldBloc>().add(SetFieldSimploEvent(s)),
          ),
          duplo: LabelInputText(
            label: 'Duplo',
            onChange: (s) => context.read<FieldBloc>().add(SetFieldDuploEvent(s)),
          ),
          flat: LabelInputText(
            label: 'Rataan',
            onChange: (s) => context.read<FieldBloc>().add(SetFieldFlatEvent(s)),
            suffix: SuffixContainer(icon: ntu,),
          ),
          rdp: LabelInputText(
            label: '%RPD',
            onChange: (s) => context.read<FieldBloc>().add(SetFieldRdpEvent(s)),
            suffix: SuffixContainer(icon: percent,),
          ),
          note: LabelInputText(
            label: 'Catatan Kualitatif',
            onChange: (s) => context.read<FieldBloc>().add(SetFieldNoteEvent(s)),
          ),
          flow: LabelCheckbox(
            label: 'Pengukuran Flow Actual',
            value: state.flow == 1 ? true : false,
            onChange: (b) => context.read<FieldBloc>().add(SetFieldFlowEvent(b ? 1 : 0)),
          ),
          actual: InputText(
            onChange: (s) => context.read<FieldBloc>().add(SetFieldActualEvent(s)),
          ),
          verify: LabelInputText(
            label: 'Status verifikasi',
            value: state.verify,
            onChange: (s) => context.read<FieldBloc>().add(SetFieldVerifyEvent(s)),
          ),
          member: WoMemberList(
            value: state.member,
            onChange: (s) => context.read<FieldBloc>().add(SetFieldMemberEvent(s)),
          ),
          first: ButtonInputText(
            controller: firstcontroller,
            label: 'Waktu Awal',
            onTap: () async {
              var t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              if (t != null) {
                sendfirst('${t.hour}:${t.minute}');
              }
            },
            value: state.first,
            suffix: clock,
          ),
          last: ButtonInputText(
            controller: lastcontroller,
            label: 'Waktu Akhir',
            onTap: () async {
              var t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              if (t != null) {
                sendlast('${t.hour}:${t.minute}');
              }
            },
            value: state.last,
            suffix: clock,
          ),
          button: PrimaryButton(
            text: 'Simpan Data',
            onTap: () {
              String s = '${TimeUtilities.now()} ${state.first}'; 
              String l = '${TimeUtilities.now()} ${state.last}'; 

              FieldModel f = FieldModel(
                first: s,
                last: l,
                test: state.test,
                simplo: state.simplo,
                duplo: state.duplo,
                flat: state.flat,
                rdp: state.rdp,
                note: state.note,
                actual: state.actual,
                verify: state.verify,
                range: state.range,
                quality: state.quality,
                quantity: state.quantity,
                flow: state.flow,
                member: state.member,
                detail: state.detail,
                id: state.detail.id
              );
              context.read<FieldBloc>().add(SetFieldEvent(f));
            },
          ),
        );
      },
    );
  }
}
