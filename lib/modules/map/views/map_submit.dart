import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';

class MapSubmit extends StatelessWidget {
  const MapSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LocationBloc, LocationState>(
      builder: (BuildContext context, LocationState state){
        return PrimaryButton(text: 'Konfirmasi Lokasi', onTap: () {
          int i = context.read<SamplingBloc>().state.sample.id!;
          LocationModel p = context.read<LocationBloc>().state.location;
          p = p.copyWith(id: i);

          context.read<LocationBloc>().add(SetLocationEvent(p));
        });
      },
      listener: (BuildContext context, LocationState state){
        if (state.status == LocationStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('update lokasi sukses')));
        }
      }
    );
  }
}
