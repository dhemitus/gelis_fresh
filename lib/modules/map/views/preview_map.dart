import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:gelis/modules/modules.dart';

class PreviewMap extends StatelessWidget {
  const PreviewMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    context.read<LocationBloc>().add(GetCurrentLocationEvent());

    return BlocBuilder<LocationBloc, LocationState>(
      buildWhen: (previus, current) => previus.location != current.location && previus.status != current.status,
      builder: (BuildContext context, LocationState state) {
        if(state.location.latitude != null && state.location.longitude != null) {
          LatLng l = LatLng(state.location.latitude!, state.location.longitude!);
          return MapContainer(
            onTap: () {
              /*WoSampleModel s = context.read<SamplingBloc>().state.sample;

              LocationModel m = LocationModel(
                id: s.id,
                address: state.location.address,
                location: s.lokasi,
                latitudeLongitude: s.latitudeLongitude,
                note: 'tidak ada'
              );*/
              
              //context.read<LocationBloc>().add(GetLocationEvent(m));

              //print(context.read<LocationBloc>().state.location);
              context.read<NavigationBloc>().add(const OnGo(path: MapRoute.path));
            },
            map: FlutterMap(
              options: MapOptions(
                initialCenter: l,
                initialZoom: 12.2
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.dhemitus.gelis',
                  tileProvider: CancellableNetworkTileProvider(),
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: l, 
                      width: 36,
                      height: 36,
                      child: mapPinSolid
                    )
                  ]
                )
              ],
            ),
          );
        } else {
          return Container();
        }

      }
    );

  }
}
