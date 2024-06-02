import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class WoMemberList extends StatelessWidget {
  final WoMemberModel? value;
  final Function(WoMemberModel)? onChange;

  const WoMemberList({Key? key, this.value, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WoDetailBloc, WoDetailState>(
      builder: (BuildContext context, WoDetailState state) {
        return state.wo.anggota != null ? LabelSelectDropDown<WoMemberModel>(
          label: 'Petugas',
          value: value,
          onChange: (s) => onChange!.call(s!),
          items: state.wo.anggota!.map<DropdownMenuItem<WoMemberModel>>((e) {
            return DropdownMenuItem<WoMemberModel>(value: e, child: Title1Text(e.nama),);
          }).toList(),
        ) : Container();
      }
    );
  }
}
