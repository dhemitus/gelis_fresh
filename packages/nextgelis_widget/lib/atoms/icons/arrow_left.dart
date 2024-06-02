import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget arrowLeft = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/arrow_left.svg',
  semanticsLabel: 'arrow left',
  colorFilter: const ColorFilter.mode(Styles.color102235, BlendMode.srcIn)
);
