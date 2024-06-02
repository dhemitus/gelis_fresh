import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SettingListItem extends StatelessWidget {
  final Widget? icon;
  final String? text;
  final VoidCallback? onTap;

  const SettingListItem({Key? key, this.icon, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BaseContainer(
        height: 56.0.w,
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon ?? Container(),
            SizedBox(width: 16.0.w,),
            Expanded(
              child: Headline3Text(text, color: Colors.white,) 
            ),
            chevronRight,
          ]
        ),
      ),
    );
  }
}
