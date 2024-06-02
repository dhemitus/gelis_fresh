import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WoListPage extends StatelessWidget {
  final Widget? calendar, menu, head, list;
  final String? label;

  const WoListPage({Key? key, this.calendar, this.menu, this.list, this.head, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        head ?? Container(),
        Column(
          children: [
            SizedBox(
              height: 158.0.w,
            ),
            Expanded(
              child: Column(
                children: [
                  menu ?? Container(),
                  calendar ?? Container(),
                  Expanded(child: list ?? Container())
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
