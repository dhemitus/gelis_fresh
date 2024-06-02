import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget root = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/root.svg',
  semanticsLabel: 'root',
  colorFilter: const ColorFilter.mode(Styles.color2FB8F7, BlendMode.srcIn)
);

Widget lightRoot = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/root.svg',
  semanticsLabel: 'root',
  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)
);
