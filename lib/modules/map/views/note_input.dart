import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class NoteInput extends StatelessWidget {
  const NoteInput ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LabelInputUnderlineText(
      label: 'Catatan abnormalitas',
      value: 'tidak ada',
      onChange: (s) => context.read<LocationBloc>().add(SetLocationNoteEvent(s)),
    );
  }
}
