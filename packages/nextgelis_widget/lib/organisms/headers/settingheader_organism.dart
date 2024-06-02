import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SettingHeader extends StatelessWidget {
  final String? label, text, icon;
  const SettingHeader({
    Key? key,
    this.label,
    this.text,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      width: 1.sw,
      child: Column(children: [
        SizedBox(height: 32.0.w,),
        const Headline1Text('Setting', color: Colors.white,),
        SizedBox(height: 42.0.w,),
        icon!.isNotEmpty ? AvatarContainer(
          icon: icon!,
          size: ButtonHeight.big,
        ) : Container(),
        SizedBox(height: 8.0.w,),
        Headline1Text(label ?? '', color: Colors.white,),
        SizedBox(height: 8.0.w,),
        Caption1Text(text, color: Styles.colorDBDFED,)
      ]),
    );
  }
}
