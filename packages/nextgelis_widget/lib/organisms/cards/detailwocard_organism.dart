import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class DetailWoCard extends StatelessWidget {
  final String? serial, title, company, contact, location, locate, type;
  final VoidCallback? onTap;
  const DetailWoCard({Key? key, this.type, this.serial, this.title, this.company, this.contact, this.location, this.locate, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WoCard(
      side: true,
      serial: serial,
      title: title,
      company: company,
      contact: contact,
      location: location,
      locate: locate,
      sign: 'On Going',
      color: type == 'water' ? Styles.color23C033 : Styles.color2FB8F7,
      icon: type == 'water' ? drop : root,
      button: SecondaryButton(
        height: ButtonHeight.small, 
        text: 'Input Hasil', 
        color: Styles.color145DB4, 
        style: SignStyle.solid,
        onTap: onTap,
      ),
    );
  }
}
