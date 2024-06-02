import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        emptyCalendar,
        SizedBox(height: 34.0.w,),
        const Title2Text('Tidak Ada Jadwal', color: Styles.color848484,),
        SizedBox(height: 2.0.w,),
        const Title2Text('Tidak ada jadwal pada tanggal tersebut', color: Styles.colorC0C0C0,),
      ],
    );
  }
}
