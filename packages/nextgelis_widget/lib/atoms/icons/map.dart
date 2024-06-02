import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget map = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/map.svg',
  semanticsLabel: 'map',
  colorFilter: const ColorFilter.mode(Styles.color6A6A6A, BlendMode.srcIn)
);

Widget mapLocation = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/map_location.svg',
  semanticsLabel: 'map location',
  colorFilter: const ColorFilter.mode(Styles.color6A6A6A, BlendMode.srcIn)
);

Widget activeMapLocation = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/map_location.svg',
  semanticsLabel: 'active map location',
  colorFilter: const ColorFilter.mode(Styles.color0A58B4, BlendMode.srcIn)
);

Widget mapPin = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/map_pin.svg',
  semanticsLabel: 'map pin',
  colorFilter: const ColorFilter.mode(Styles.colorD30000, BlendMode.srcIn)
);

Widget mapPinSolid = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/map_pin_solid.svg',
  semanticsLabel: 'map pin solid',
);
