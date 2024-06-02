import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class UserPage extends StatelessWidget {
  final Widget? child, head, menu;
  final String? label;
  const UserPage({Key? key, this.child, this.head, this.menu, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.color053978,
      body: Column(
        children: [
          SizedBox(
            height: 364.0.w,
            child: head ?? Container(),
          ),
          Expanded(
            child: child ?? BaseContainer(width: 1.sw, height: double.infinity,),
          ),
        ],
      ),
    );
  }
}
