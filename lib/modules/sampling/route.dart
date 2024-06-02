import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class SamplingRoute {
  static const String path = '/sampling';
  static const Key key = Key('__samplingScreen__');
  static Route<void> route = MaterialPageRoute<void>(
      builder: (_) => const SamplingScreen());

  static final BlocProvider bloc = BlocProvider<SamplingBloc>(
    create: (BuildContext context) => SamplingBloc(RepositoryProvider.of<SamplingRepository>(context)),
  );

  static final RepositoryProvider repo = RepositoryProvider<SamplingRepository>(
    create: (BuildContext context) => SamplingRepository()
  );
}
