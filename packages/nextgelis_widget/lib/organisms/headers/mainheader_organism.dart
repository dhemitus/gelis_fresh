import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class MainHeader extends StatelessWidget {
  final String? label, text, icon;
  const MainHeader({
    Key? key,
    this.label,
    this.text,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      width: 1.sw,
      height: 230.0.w,
      color: Styles.color145DB4,
      child: Stack(
        children: <Widget>[
          blueCloud,
          Padding(
            padding: EdgeInsets.only(top: 72.0.w, left: 22.0.w),
              child: AvatarHeader(
              label: label,
              text: text,
              widget: icon!.isNotEmpty ? AvatarContainer(
                icon: icon!,
              ) : Container(),
            ),
          )
        ]
      ),
    );
  }
}
