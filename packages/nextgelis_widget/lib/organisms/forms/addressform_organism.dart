import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressForm extends StatelessWidget {
  final Widget? coord, location, note, button;

  const AddressForm({Key? key, this.coord, this.location, this.note, this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12.0.w),
          child: coord ?? Container(),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 12.0.w),
          child: location ?? Container(),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 12.0.w),
          child: note ?? Container(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 44.0.w, vertical: 8.0.w),
          child: button ?? Container(),
        ),
      ],
    );
  }
}
