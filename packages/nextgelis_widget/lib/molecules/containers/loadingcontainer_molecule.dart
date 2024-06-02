import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.color0A58B4),
        ),
        SizedBox(height: 14.0.w,),
        const Title2Text('Tunggu', color: Styles.color848484,),
      ],
    );
  }
}
