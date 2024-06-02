import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConditionForm extends StatelessWidget {
  final Widget? button, map, browse;
  final List<Widget>? inputs;
  const ConditionForm({Key? key, this.button, this.map, this.browse, this.inputs}) : super(key: key);

  List<Widget> list() {
    List<Widget> l = [];
    l.add(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
        child: map ?? Container()
      ),
    );
    if(inputs != null && inputs!.isNotEmpty) {
      inputs!.map((e) {
        l.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
            child: e,
          ),
        );
      } 
      ).toList();
    }
    l.add(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
        child: browse ?? Container(),
      ),
    );
    l.add( 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 68.0.w, vertical: 16.0.w),
        child: button
      )
    );
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: list()
      ),
    );
  }
}
