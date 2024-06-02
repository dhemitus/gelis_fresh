import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class FieldInputForm extends StatelessWidget {
  final Widget? first, last, range, quality, test, simplo, duplo, flat, rdp, note, flow, actual, verify, member, button;
  final String? label, title, subtitle, endtitle;

  const FieldInputForm({Key? key,
    this.first,
    this.last,
    this.range,
    this.quality,
    this.test,
    this.simplo,
    this.duplo,
    this.flat,
    this.rdp,
    this.note,
    this.flow,
    this.actual,
    this.verify,
    this.member,
    this.button,
    this.label,
    this.title,
    this.subtitle,
    this.endtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
            child: LabelHeader(label: label)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: LabelHeader(label: title)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: LabelHeader(label: subtitle)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: LabelHeader(label: endtitle)
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: range ?? Container(),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: quality ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: note ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: test ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: simplo ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: duplo ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: flat ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: rdp ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: flow ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: actual ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: verify ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: first ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: last ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 12.0.w),
            child: member ?? Container(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44.0.w, vertical: 8.0.w),
            child: button ?? Container(),
          ),
        ],
      ),
    );
  }
}
