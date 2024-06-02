import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class MapScreen extends StatelessWidget {
  const MapScreen ({Key? key}) : super(key: MapRoute.key);

  @override
  Widget build(BuildContext context) {

    void back() {
      context.read<NavigationBloc>().add(const OnBack());
    }

    return MapPage(
      head: SimpleTitleHeader(
          back: true,
          onBack: back,
          label: 'Tentukan titik lokasi'
      ),
      child: Stack(children: [
        const DisplayMap(),
        DraggableScrollableSheet(
          initialChildSize: .6,
          minChildSize: .2,
          maxChildSize: .6,
          builder:(BuildContext context, ScrollController scrollcontroller) {
            return BottomSheetContainer(
              scrollcontroller: scrollcontroller,
              head: const AddressDesc(),
              body: const MapForm(),
            );
           }
        )
      ],
    ),
    );
  }
}
