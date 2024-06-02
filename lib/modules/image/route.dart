import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class ImageRoute {
  
  static final BlocProvider bloc = BlocProvider<ImageBloc>(
    create: (BuildContext context) => ImageBloc(RepositoryProvider.of<ImageRepository>(context)),
  );

  static final RepositoryProvider repo = RepositoryProvider<ImageRepository>(
    create: (BuildContext context) => ImageRepository(),
  );
}
