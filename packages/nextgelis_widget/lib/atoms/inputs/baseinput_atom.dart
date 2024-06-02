import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class BaseInput extends StatelessWidget {
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
  final Color? fill, cursor;
  final EdgeInsets? padding;
  final TextStyle? style, labelStyle, hintStyle;

  const BaseInput(
      {Key? key, this.listener,
        this.label,
        this.hint,
        this.value,
        this.error,
        this.controller,
        this.line,
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
        this.style,
        this.labelStyle,
        this.hintStyle,
        this.cursor,
        this.fill,
        this.padding = const EdgeInsets.symmetric(horizontal: 0),
        this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      cursorColor: cursor ?? Styles.color6A6A6A,
      controller: controller,
      maxLines: line,
      style: style ?? Styles.text16W600,
      obscureText: password,
      enabled: enable,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      textInputAction: inputAction ?? TextInputAction.done,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: padding,
        fillColor: fill,
        filled: true,
        isDense: true,
        labelText: label,
        labelStyle: labelStyle ?? Styles.text16W600
            .copyWith(color: Styles.color848484),
        hintStyle: hintStyle ?? Styles.text16W600
            .copyWith(color: Styles.color848484),
        enabledBorder: border ??
            OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0.w),
            borderSide: const BorderSide(
                color: Styles.colorC0C0C0
            )
        ),
        focusedBorder: focusBorder ??
            OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0.w),
            borderSide: const BorderSide(
                color: Styles.colorC0C0C0
            )
        ),
        disabledBorder: disabledBorder != null
            ? focusBorder
            : OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0.w),
            borderSide: const BorderSide(
                color: Styles.colorD1D2D4
            )
        ),
        prefixIcon: preffix,
        suffixIcon: suffix,
        hintText: hint,
        errorText: error,
      ),
    );
  }
}
