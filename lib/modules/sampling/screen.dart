import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SamplingScreen extends StatelessWidget {
  const SamplingScreen({Key? key}) : super(key: SamplingRoute.key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SamplingBloc, SamplingState>(
      buildWhen: (previous, current) => previous.status != current.status && previous.sample != current.sample,
      builder: (BuildContext context, SamplingState state){
        return SamplingPage(
          head: CrumbMenu(code: state.sample.kodeSample,),
          child: const SamplingSlider(),
        );
      },
    );
  }
}
