import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ApproveWoCard extends StatelessWidget {
  final String? serial, title, company, contact, location, locate, type;
  final VoidCallback? onTap, onCard;
  const ApproveWoCard({Key? key, this.type, this.serial, this.title, this.company, this.contact, this.location, this.locate, this.onTap, this.onCard}) : super(key: key);

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
      sign: 'Approve WO',
      color: type == 'water' ? Styles.color23C033 : Styles.color2FB8F7,
      icon: type == 'water' ? drop : root,
      onCard: onCard,
      button: SecondaryButton(
        height: ButtonHeight.small, 
        text: 'Hubungi Penyelia', 
        color: Styles.color66717C,
        textColor: Styles.color66717C,
        style: SignStyle.line,
        onTap: onTap,
      ),
    );
  }
}
