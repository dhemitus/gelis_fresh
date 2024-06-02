import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class InputText extends StatelessWidget {
  final Function? listener;
  final String? label, hint, error, value;
  final TextEditingController? controller;
  final bool password, enable, dark;
  final Widget? suffix, preffix;
  final int? line;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange, onSubmit;
  final TextInputAction? inputAction;
  final InputBorder? border, focusBorder, disabledBorder;
  final Color? fill;
  final EdgeInsets? padding;

  const  InputText(
      {Key? key, this.listener,
        this.label,
        this.hint,
        this.value,
        this.error,
        this.controller,
        this.line = 1,
        this.suffix,
        this.preffix,
        this.password = false,
        this.enable = true,
        this.dark = false,
        this.inputType,
        this.onChange,
        this.onSubmit,
        this.inputAction,
        this.border,
        this.focusBorder,
        this.disabledBorder,
        this.fill,
        this.padding,
        this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: line! * 56.0.w,
      child: BaseInput(
        value: value,
        line: line,
        listener: listener,
        label: label,
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
        border: border,
        focusBorder: focusBorder,
        disabledBorder: disabledBorder,
        padding: padding ?? EdgeInsets.all(14.0.w),
        fill: Colors.transparent,
      ),
    );
  }
}
