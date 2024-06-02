import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ButtonInputText extends StatelessWidget {
  final Function? onTap;
  final String? label, hint, error, value;
  final TextEditingController? controller;
  final Widget? preffix, widget, suffix;
  final ValueChanged<String>? onChange, onSubmit;

  const ButtonInputText({Key? key,
    this.onTap,
    this.label,
    this.hint,
    this.value,
    this.error,
    this.controller,
    this.suffix,
    this.preffix,
    this.widget,
    this.onChange,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: LabelInputText(
        enable: false,
        hint: hint,
        label: label,
        error: error,
        value: value,
        controller: controller,
        suffix: SuffixContainer(icon: suffix),
        preffix: preffix,
        widget: widget,
        onChange: onChange,
        onSubmit: onSubmit,
      )
    );
  }
}
