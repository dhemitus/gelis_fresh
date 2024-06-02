import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget drop = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/drop.svg',
  semanticsLabel: 'drop',
  colorFilter: const ColorFilter.mode(Styles.color23C033, BlendMode.srcIn)
);

Widget lightDrop = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/drop.svg',
  semanticsLabel: 'drop',
  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)
);
