import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class MapContainer extends StatelessWidget {
  final Widget? map;
  final Function? onTap;
  const MapContainer({Key? key, this.map, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      height: 306.0.w,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          BaseContainer(
            height: 80.0.w,
            radius: BorderRadius.only(topLeft: Radius.circular(10.0.w), topRight: Radius.circular(10.0.w)),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Styles.color145DB4,
                Styles.color06438B
              ]
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4.0.w),
                child: const Caption1Text(
                  'Masukkan koordinat titik sampling anda\ndengan membuka peta',
                  color: Colors.white,
                  align: TextAlign.center,
                ),
              ),
              BaseContainer(
                height: 260.0.w,
                color: Colors.white,
                radius: BorderRadius.only(topLeft: Radius.circular(10.0.w), topRight: Radius.circular(10.0.w)),
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  children: [
                    BaseContainer(
                      height: 146.0.w,
                      radius: BorderRadius.circular(6.0.w),
                      margin: EdgeInsets.only(bottom: 16.0.w),
                      child: map ?? const Caption3Text('empty'),
                    ),
                    PrimaryButton(onTap: onTap, text: 'Buka Peta',)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
