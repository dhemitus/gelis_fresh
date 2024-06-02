import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

Widget flaskRound = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/flask_round.svg',
  semanticsLabel: 'flask round',
  colorFilter: const ColorFilter.mode(Styles.color6A6A6A, BlendMode.srcIn),
);

Widget flaskConical = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/flask_conical.svg',
  semanticsLabel: 'flask conical',
  colorFilter: const ColorFilter.mode(Styles.color6A6A6A, BlendMode.srcIn),
);

Widget activeFlaskConical = SvgPicture.asset(
  'packages/nextgelis_widget/assets/icons/flask_conical.svg',
  semanticsLabel: 'active flask conical',
  colorFilter: const ColorFilter.mode(Styles.color0A58B4, BlendMode.srcIn)
);
