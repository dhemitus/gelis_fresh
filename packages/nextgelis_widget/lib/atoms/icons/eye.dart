import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget eye = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/eye.svg',
  semanticsLabel: 'eye',
  colorFilter: const ColorFilter.mode(Styles.color6A6A6A, BlendMode.srcIn)
);

Widget eyeOff = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/eye_off.svg',
  semanticsLabel: 'eye off',
  colorFilter: const ColorFilter.mode(Styles.color6A6A6A, BlendMode.srcIn)
);
