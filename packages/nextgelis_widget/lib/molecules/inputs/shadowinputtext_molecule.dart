import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ShadowInputText extends StatelessWidget {
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
  final Color? fill;
  final EdgeInsets? padding;

  const  ShadowInputText(
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
        this.fill,
        this.padding = const EdgeInsets.symmetric(horizontal: 0),
        this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: line! * 56.0.w,
      shadow: const [
        BoxShadow(
        color: Colors.black12, 
        blurRadius: 6, 
        offset: Offset(0, 6))
      ],
      child: BaseInput(
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
        style: Styles.text16W600,
        labelStyle: Styles.text16W600,
        hintStyle: Styles.text16W600,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.w),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)
        ),
        focusBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.w),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.w),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)
        ),
        padding: EdgeInsets.all(14.0.w),
        fill: Colors.white,
      ),
    );
  }
}
