import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelis/modules/modules.dart';

class SamplingSlider extends StatelessWidget {
  const SamplingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(
      initialPage: 0,
      viewportFraction: 1,
      keepPage: true,
      
    );

    void onChange(int i) {
      CrumbItem e = context.read<CrumbBloc>().state.crumb;
      e = e.copyWith(route: i);
      context.read<CrumbBloc>().add(SetCrumbEvent(e));
    }

    return BlocConsumer<CrumbBloc, CrumbState>(
      listenWhen: (previous, current) => previous.crumb != current.crumb,
      listener: (BuildContext context, CrumbState state) {
        controller.animateToPage(state.crumb.route!, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      buildWhen: (previous, current) => previous.crumb != current.crumb,
      builder: (BuildContext context, CrumbState state) {
        return PageView(
          controller: controller,
          pageSnapping: true,
          allowImplicitScrolling: false,
          onPageChanged: onChange,
          children: const [
            SamplingDetail(),
            SamplingNtu(),
            SamplingProcess()
          ],
        );
      }
    );
  }
}
