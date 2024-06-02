import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class EmptyTextContainer extends StatelessWidget {
  const EmptyTextContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Title2Text('Tidak Ada Data', color: Styles.color848484,),
      ],
    );
  }
}
