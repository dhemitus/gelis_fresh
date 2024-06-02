import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LabelInputUnderlineText extends StatelessWidget {
  final Function? listener;
  final String? label, hint, error, value;
  final TextEditingController? controller;
  final bool password, enable, dark;
  final Widget? suffix, preffix, widget;
  final int? line;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange, onSubmit;
  final TextInputAction? inputAction;

  const  LabelInputUnderlineText(
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
        SizedBox(
          child: InputText(
            value: value,
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
            padding: EdgeInsets.symmetric(horizontal: 4.0.w),
            fill: Colors.transparent,
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Styles.colorC0C0C0
              )
            ),
            focusBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Styles.colorC0C0C0
              )
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(

              )
            ),
          ),
        ),
      ],
    );
  }
}
