import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SimpleTitleHeader extends StatelessWidget {
  final String? label;
  final Function()? onBack;
  final bool? back;
  const SimpleTitleHeader({
    Key? key,
    this.label,
    this.onBack,
    this.back = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 60.0.w, left: 20.0.w, right: 20.0.w), 
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            back! ? BaseContainer(
              padding: EdgeInsets.only(right: 20.0.w),
              height: 36.0.w,
              child: TurnBackButton(onTap: onBack),
            ) : Container(),
            BaseContainer(
              height: 36.0.w, 
              child: Title2Text(label, color: Styles.color102235,),
            )
          ],
        ),
      );
  }
}
