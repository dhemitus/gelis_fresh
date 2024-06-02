import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class HistoryDescription extends StatelessWidget {
  final String? title, company, location, locate, picture;
  final Color? color;
  const HistoryDescription({Key? key, this.title, this.company, this.location, this.locate, this.picture, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        MediaContainer(icon: picture!),
        SizedBox(width: 12.0.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Title1Text(title ?? '', color: Styles.color3B4958),
            SizedBox(height: 2.0.w,),
            SizedBox(
              width: 248.0.w,
              child: Title1Text(company ?? '', color: color, overflow: TextOverflow.ellipsis,),
            ),
            SizedBox(height: 2.0.w,),
                  SizedBox(height: 2.0.w,),
                  Row(
                    children: [
                      LocationMark(label: location ?? '',),
                      SizedBox(width: 8.0.w,),
                      LocateMark(
                        label: locate ?? '',
                      ),
                    ],
                  ),

          ]
        )
      ],
    );
  }
}
