import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/atoms/containers/gradientcontainer_atom.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class UnknownPage extends StatelessWidget {

  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          const InsideContainer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: GradientContainer(
              height: .5.sh,
              width: 1.sw,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.0.w),
              child: const LogoContainer(),
            )
          )
        ],
      ),
    );
  }
}
