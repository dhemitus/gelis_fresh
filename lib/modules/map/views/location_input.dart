import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LocationInput extends StatelessWidget {
  const LocationInput ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void onChange(String s) {
      LocationModel l = context.read<LocationBloc>().state.location;
      l = l.copyWith(location: s);
      context.read<LocationBloc>().add(GetLocationEvent(l));
    }

    return BlocBuilder<LocationBloc, LocationState>(
      builder: (BuildContext context, LocationState state){
        return LabelInputUnderlineText(label: 'Detail lokasi sampling', value: state.location.location ?? '', onChange: onChange);
      },
    );
  }
}
