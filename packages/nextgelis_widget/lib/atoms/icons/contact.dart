import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget contact = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/contact.svg',
  semanticsLabel: 'contact',
  colorFilter: const ColorFilter.mode(Styles.color6A6A6A, BlendMode.srcIn)
);
