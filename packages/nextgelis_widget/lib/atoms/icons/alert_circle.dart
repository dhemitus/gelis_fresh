import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget alertCircleError = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/alert_circle.svg',
  semanticsLabel: 'alert circle error',
  colorFilter: const ColorFilter.mode(Styles.colorBD251C, BlendMode.srcIn)
);
