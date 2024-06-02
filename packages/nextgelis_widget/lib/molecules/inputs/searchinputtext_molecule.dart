import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SearchInputText extends StatelessWidget {
  final Function? listener;
  final String? label, hint, error, value;
  final TextEditingController? controller;
  final bool password, enable, dark;
  final Widget? suffix, preffix;
  final int? line;
  final TextInputType? inputType;
  final VoidCallback? onTap, onSearch;
  final ValueChanged<String>? onChange, onSubmit;
  final TextInputAction? inputAction;
  final InputBorder? border, focusBorder, disabledBorder;
  final Color? fill;
  final EdgeInsets? padding;

  const  SearchInputText(
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
      this.padding = const EdgeInsets.symmetric(horizontal: 0),
      this.onTap,
      this.onSearch
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
//      height: line * 46.0.w,
      child: BaseInput(
        line: line,
        listener: listener,
        label: label,
        hint: hint,
        error: error,
        controller: controller,
        suffix: BaseContainer(
          width: 100.0.w, 
          padding: EdgeInsets.only(right: 8.0.w),
          child: PrimaryButton(height: ButtonHeight.smaller, text: 'Search', onTap: onSearch,),
        ),
        preffix: preffix,
        password: password,
        enable: enable,
        dark: dark,
        inputType: inputType,
        onTap: onTap,
        onChange: onChange,
        onSubmit: onSubmit,
        inputAction: inputAction ?? TextInputAction.go,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Styles.color145DB4, width: 1.0.w), 
          borderRadius: BorderRadius.all(
              Radius.circular(10.0.w)
          ), 
        ),
        focusBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Styles.color145DB4, width: 1.0.w), 
          borderRadius: BorderRadius.all(
            Radius.circular(10.0.w)
          ), 
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Styles.color145DB4, width: 1.0.w), 
          borderRadius: BorderRadius.all(
            Radius.circular(10.0.w)
          ), 
        ),
        padding: EdgeInsets.only(left: 10.0.w),
        fill: Colors.transparent,
      ),
    );
  }
}
