import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SignContainer extends StatelessWidget {
  final Widget? icon;
  final SignStyle? style;
  final SignModel? model;
  final String? text;
  final Color? color, labelColor, markColor;
  final bool? desc;
  final VoidCallback? onTap;
  final Function(BuildContext)? onItem;
  final Function(dynamic)? onSelect;

  const SignContainer({Key? key, this.icon, this.style, this.text, this.color, this.labelColor, this.markColor, this.model = SignModel.sign, this.desc = false, this.onTap, this.onItem, this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Row(
        children: <Widget>[
          model == SignModel.sign ? 
            LabelSignContainer(color: color, style: style, text: text,) : 
            MarkSignContainer(text: text, color: markColor, labelColor: labelColor,),
          SizedBox(width: 4.0.w,),
          IconSignContainer(
            icon: icon,
            style: style,
            color: color,
          ),
          desc! ? PopupMenuButton(onSelected: onSelect, itemBuilder: (context) => onItem!.call(context)) : Container()
          //desc! ? DescButton(onTap: onTap,) : Container()
        ]
      ),
    );
  }
}
