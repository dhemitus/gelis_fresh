import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class AddressContainer extends StatelessWidget {
  final String? street, address, latlang;
  const AddressContainer({Key? key, this.street, this.address, this.latlang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(bottom: 16.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Title1Text('Detail Alamat'),
          SizedBox(height: 8.0.w,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mapPinSolid,
              SizedBox(width: 8.0.w,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title2Text(street ?? ''),
                  Body1Text(address ?? ''),
                  Body2Text(latlang ?? '')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
