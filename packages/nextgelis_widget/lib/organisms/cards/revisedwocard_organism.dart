import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class RevisedWoCard extends StatelessWidget {
  final String? serial, title, company, contact, location, locate, type;
  final VoidCallback? onTap, onCard;
  const RevisedWoCard({Key? key, this.type, this.serial, this.title, this.company, this.contact, this.location, this.locate, this.onTap, this.onCard}) : super(key: key);

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
      sign: 'Telah di revisi',
      color: Styles.colorE55604,
      signStyle: SignStyle.solid,
      icon: type == 'water' ? lightDrop : lightRoot,
      onCard: onCard,
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
