import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LabelInputText extends StatelessWidget {
  final Function? listener;
  final String? label, hint, error, value;
  final TextEditingController? controller;
  final bool password, enable, dark, withSuffix;
  final Widget? suffix, preffix, widget;
  final int? line;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange, onSubmit;
  final TextInputAction? inputAction;

  const  LabelInputText(
      {Key? key, this.listener,
        this.label,
        this.hint,
        this.value,
        this.error,
        this.controller,
        this.line = 1,
        this.suffix,
        this.preffix,
        this.widget,
        this.password = false,
        this.enable = true,
        this.dark = false,
        this.withSuffix = true,
        this.inputType,
        this.onChange,
        this.onSubmit,
        this.inputAction,
        this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LabelHeader(label: label, widget: widget,),
        SizedBox(height: 8.0.w,),
        /*SizedBox(
          child: */InputText(
            line: line,
            listener: listener,
            hint: hint,
            error: error,
            controller: controller,
            suffix: suffix,
            preffix: preffix,
            password: password,
            enable: enable,
            dark: dark,
            inputType: inputType,
            onTap: onTap,
            onChange: onChange,
            onSubmit: onSubmit,
            inputAction: inputAction,
            padding: EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 12.0.w),
            fill: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.w),
              borderSide: const BorderSide(
                color: Styles.colorC0C0C0
              )
            ),
            focusBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.w),
              borderSide: const BorderSide(
                  color: Styles.colorC0C0C0
              )
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.w),
              borderSide: const BorderSide(
                  color: Styles.colorC0C0C0
              )
            ),
          ),
        //),
      ],
    );
  }
}
