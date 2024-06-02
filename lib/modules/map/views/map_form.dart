import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';

class MapForm extends StatelessWidget {
  const MapForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AddressForm(
      coord: CoordInput(),
      location: LocationInput(),
      note: NoteInput(),
      button: MapSubmit(),
    );
  }
}
