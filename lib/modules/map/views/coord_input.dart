import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/location/location.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CoordInput extends StatelessWidget {
  const CoordInput ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (BuildContext context, LocationState state) {
        return UnderlineLabel(label: 'Input Koordinat', text: state.location.latitudeLongitude,);
      },
    );
  }
}
