import 'package:flutter/material.dart';
import 'package:gelis/modules/modules.dart';

class MapRoute {
  static const String path = '/map';
  static const Key key = Key('__mapScreen__');
  static Route<void> route = MaterialPageRoute<void>(builder: (_) => const MapScreen());
 
  /*static final BlocProvider bloc = BlocProvider<MapsBloc>(
    create: (BuildContext context) => MapsBloc(RepositoryProvider.of<MapRepository>(context)),
  );

  static final RepositoryProvider repo = RepositoryProvider(
    create: (BuildContext context) => MapRepository()
  );*/
}
