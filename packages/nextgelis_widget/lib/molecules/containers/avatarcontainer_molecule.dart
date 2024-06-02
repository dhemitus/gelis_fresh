import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class AvatarContainer extends StatelessWidget {
  final String icon;
  final ButtonHeight? size;
  const AvatarContainer({Key? key, required this.icon, this.size = ButtonHeight.small}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleImageContainer(
      image: ImageUtilities.imageNetwork(icon),
      size: size,
    );
  }
}
