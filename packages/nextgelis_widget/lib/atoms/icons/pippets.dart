import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget pippets = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/pippete.svg',
  semanticsLabel: 'pippets',
  colorFilter: const ColorFilter.mode(Styles.color6A6A6A, BlendMode.srcIn)
);

Widget activePippets = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/pippete.svg',
  semanticsLabel: 'active pippets',
  colorFilter: const ColorFilter.mode(Styles.color0A58B4, BlendMode.srcIn)
);
