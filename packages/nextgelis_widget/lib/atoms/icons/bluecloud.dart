import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget blueCloud = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/bluecloud.svg',
  semanticsLabel: 'blue cloud',
  colorFilter: const ColorFilter.mode(Styles.color053978, BlendMode.srcIn)
);
