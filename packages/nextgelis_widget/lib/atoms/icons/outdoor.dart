import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget outdoor = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/outdoor.svg',
  semanticsLabel: 'outdoor',
  colorFilter: const ColorFilter.mode(Styles.color0777E8, BlendMode.srcIn)
);
