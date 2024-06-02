import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class CardHeader extends StatelessWidget {
  final String? label, text;
  final Widget? sign;
  const CardHeader({Key? key, this.label, this.text, this.sign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      border: Border(bottom: BorderSide(color: Styles.colorD1D2D4, width: 1.0.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Body2Text(label ?? '', color: Styles.color3B4958),
              Caption1Text(text ?? '', color: Styles.color3B4958,)
            ],
          ),
          sign ?? Container()
        ],
      ),
    );
  }
}
