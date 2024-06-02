import 'package:flutter/material.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class HistoryWoCard extends StatelessWidget {
  final String? serial, title, company, contact, location, locate, type, picture, status, date;
  final VoidCallback? onTap;
  const HistoryWoCard({
    Key? key,
    this.type,
    this.serial,
    this.title,
    this.company,
    this.contact,
    this.location,
    this.locate,
    this.picture,
    this.status,
    this.date,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return HistoryCard(
      side: true,
      serial: serial,
      title: title,
      company: company,
      contact: contact,
      location: location,
      locate: locate,
      picture: picture,
      status: status,
      date: date,
      sign: status,
      labelColor: status == 'dibatalkan' ? Styles.colorD30000 : type == 'water' ? Styles.color0CA016 : Styles.color0C62A0,
      markColor: status == 'dibatalkan' ? Styles.colorF8D7D7 : type == 'water' ? Styles.colorD6FFDC : Styles.colorD6EEFF,
      color: type == 'water' ? Styles.color23C033 : Styles.color2FB8F7,
      icon: type == 'water' ? drop : root,
      button: SecondaryButton(
        height: ButtonHeight.small, 
        text: 'Lihat Data', 
        color: type == 'water' ? Styles.color23C033 : Styles.color2FB8F7, 
        style: SignStyle.solid,
        onTap: onTap,
      ),
    );
  }
}
