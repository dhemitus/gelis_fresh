import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class WoCard extends StatelessWidget {
  final bool side, desc;
  final String? serial, title, company, contact, location, locate, sign;
  final Color? color;
  final Widget? icon, button;
  final SignStyle? signStyle;
  final VoidCallback? onTap, onCard;
  final Function(BuildContext)? onItem;
  final Function(dynamic)? onSelect;

  const WoCard({
    Key? key, 
    this.side = true, 
    this.desc = false,
    this.serial, 
    this.title, 
    this.company, 
    this.contact, 
    this.location, 
    this.locate, 
    this.sign,
    this.color = Styles.color2FB8F7,
    this.icon,
    this.button,
    this.signStyle = SignStyle.line,
    this.onTap,
    this.onCard,
    this.onItem,
    this.onSelect
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onCard,
      child: BaseContainer(
        margin: EdgeInsets.only(bottom: 16.0.w),
        color: Colors.white,
        radius: BorderRadius.circular(16.0.w),
        border: Border.all(color: Styles.colorD1D2D4, width: 1.0.w),
        child: IntrinsicHeight(
          child: Row(
            children: [
              side ? SideBarContainer(color: color) : Container(),
              Flexible(
                child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0.w, horizontal: 22.0.w),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Body2Text(serial ?? '', color: Styles.color3B4958),
                        SignContainer(text: sign ?? '', style: signStyle, icon: icon, color: color, desc: desc, onTap: onTap, onItem: onItem, onSelect: onSelect,)
                      ],
                    ),
                    SizedBox(height: 10.0.w,),
                    Title1Text(title ?? '', color: Styles.color3B4958,),
                    SizedBox(height: 10.0.w,),
                    Title1Text(company ?? '', color: Styles.color006FB0),
                    SizedBox(height: 10.0.w,),
                    ContactLabel(label: contact ?? ''),
                    SizedBox(height: 10.0.w,),
                    LocationLabel(label: location ?? '',),
                    SizedBox(height: 10.0.w,),
                    LocateLabel(
                      label: locate ?? '',
                      suffix: button ?? Container(),
                    )
                  ],
                ),
                )
              )
            ]
          ),
        ),
      ),
    );

  }
}
