import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget? head, body;
  final ScrollController scrollcontroller;
  const BottomSheetContainer ({Key? key, required this.scrollcontroller, this.head, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 2.0.w, left: 16.0.w, right: 16.0.w, bottom: 22.0.w),
      color: Colors.white,
      radius: const BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
      child: SingleChildScrollView(
        controller: scrollcontroller,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BaseContainer(
              height: 42.0,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 8.0.w),
              child: bar,
            ),
            head ?? Container(),
            body ?? Container(),
          ],
        ),
      ),
    );
  }
}
