import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class RevisionWoCard extends StatelessWidget {
  final String? serial, title, company, contact, location, locate, type;
  final VoidCallback? onTap, onCard;
  const RevisionWoCard({Key? key, this.type, this.serial, this.title, this.company, this.contact, this.location, this.locate, this.onTap, this.onCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WoCard(
      side: false,
      serial: serial,
      title: title,
      company: company,
      contact: contact,
      location: location,
      locate: locate,
      onCard: onCard,
      sign: 'Konfirmasi Marketing',
      color: Styles.colorFBBF24,
      icon: type == 'water' ? lightDrop : lightRoot,
      signStyle: SignStyle.solid,
    );
  }
}
