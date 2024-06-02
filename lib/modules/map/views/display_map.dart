import 'package:flutter/material.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gelis/modules/modules.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class DisplayMap extends StatelessWidget {
  const DisplayMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<LocationBloc>().add(GetCurrentLocationEvent());
                      print(context.read<SamplingBloc>().state.sample);
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (BuildContext context, LocationState state) {
        if(state.location.latitude != null && state.location.longitude != null) {
          LatLng l = LatLng(state.location.latitude!, state.location.longitude!);
          return FlutterMap(
            options: MapOptions(
              initialCenter: l,
              initialZoom: 10.2
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.dhemitus.gelis',
                tileProvider: CancellableNetworkTileProvider(),
              ),
              DragMarkers(
                markers: [
                  DragMarker(
                    point: l, 
                    size: const Size.square(36),
                    builder: (_,__,___) => mapPinSolid,
                    onDragEnd: (detail, point) {
                     LocationModel p = context.read<LocationBloc>().state.location;
                      p = p.copyWith(latitudeLongitude: '${point.latitude}, ${point.longitude}', latitude: point.latitude, longitude: point.longitude);
                      context.read<LocationBloc>().add(GetLocationEvent(p));
                    }
                  )
                ],
                alignment: Alignment.topCenter,
              )
            ],
          );
        } else {
          return Container();
        }
      }
    );
  }
}
