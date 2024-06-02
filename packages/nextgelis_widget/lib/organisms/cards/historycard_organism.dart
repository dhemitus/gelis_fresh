import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class HistoryCard extends StatelessWidget {
  final bool side;
  final String? serial, title, company, contact, location, locate, sign, picture, status, date;
  final Color? color, markColor, labelColor;
  final Widget? icon, button;
  const HistoryCard({
    Key? key, 
    this.side = true, 
    this.serial, 
    this.title, 
    this.company, 
    this.contact, 
    this.location, 
    this.locate, 
    this.sign,
    this.picture,
    this.status,
    this.date,
    this.color = Styles.color2FB8F7,
    this.markColor = Styles.colorD6EEFF,
    this.labelColor = Styles.color0C62A0,
    this.icon,
    this.button
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BaseContainer(
      margin: EdgeInsets.only(bottom: 16.0.w),
      color: Colors.white,
      radius: BorderRadius.circular(16.0.w),
      border: Border.all(color: Styles.colorD1D2D4, width: 1.0.w),
      child: IntrinsicHeight(
        child: Row(
          children: [
            side ? SideBarContainer(color: status == 'dibatalkan' ? Styles.colorD30000 : color) : Container(),
            Flexible(
              child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.w, horizontal: 22.0.w),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CardHeader(
                    text: date,
                    label: serial,
                    sign: SignContainer(
                      text: sign ?? '',
                      style: SignStyle.line,
                      icon: icon,
                      color: color,
                      labelColor: labelColor,
                      markColor: markColor,
                      model: SignModel.mark,
                    ),
                  ),
                  SizedBox(height: 10.0.w,),
                  HistoryDescription(color: color, title: title, company: company, location: location, locate: locate, picture: picture,),
                  SizedBox(height: 10.0.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      status == 'dibatalkan' ? Container() :  button!
                    ],
                  ),
                ],
              ),
              )
            )
          ]
        ),
      ),
    );
  }
}
