import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';

class AddressDesc extends StatelessWidget {
  const AddressDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      buildWhen: (previuos, current) => previuos.status != current.status && previuos.location != current.location,
      builder: (BuildContext context, LocationState state) {
        return AddressContainer(
          street: state.location.location ?? '',
          address: state.location.address ?? '',
          latlang: state.location.latitudeLongitude ?? '',
        );
      },
    );
  }
}
