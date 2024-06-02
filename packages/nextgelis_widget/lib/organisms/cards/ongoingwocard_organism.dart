import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class OnGoingWoCard extends StatelessWidget {
  final String? serial, title, company, contact, location, locate, type;
  final VoidCallback? onTap, onDesc, onCard;
  final Function(BuildContext)? onItem;
  final Function(dynamic)? onSelect;

  const OnGoingWoCard({Key? key, this.type, this.serial, this.title, this.company, this.contact, this.location, this.locate, this.onTap, this.onDesc, this.onCard, this.onItem, this.onSelect}) : super(key: key);

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
      desc: true,
      onTap: onDesc,
      onCard: onCard,
      onItem: onItem,
      onSelect: onSelect,
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
