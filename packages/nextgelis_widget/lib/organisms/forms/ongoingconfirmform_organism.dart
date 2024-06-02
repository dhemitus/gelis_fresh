import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class OnGoingConfirmForm extends StatelessWidget {
  final Widget? username, password, button, error;
  final VoidCallback? onCancel, onConfirm;
  const OnGoingConfirmForm({Key? key, this.username, this.password, this.button, this.error, this.onCancel, this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomContainer(
      height: 386.0.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 24.0.w),
            child: SingleTextHeader(label: 'Lakukan Perjalanan', onClose: onCancel,) 
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: const Title2Text('Sampling Air Limbah'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: const Caption1Text('Pilih pertemuan'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 18.0.w),
            child: const SelectDropDown<String>(
                  width: double.infinity,
                  items: [
                    DropdownMenuItem(value: 'Kunjungan Lapangan', child: Caption1Text('Kunjungan Lapangan')),
                  ], 
                  onChange: null,
                  value: 'Kunjungan Lapangan',
                ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.0.w, vertical: 16.0.w),
            child: const BigAlertContainer(label: 'Pastikan anda telah menghubungi PIC sebelum melakukan perjalanan',)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 16.0.w),
            child: Row(
              children: [
                Expanded(child: Container()),
                SecondaryButton(
                  height: ButtonHeight.small, 
                  text: 'Tutup', 
                  color: Styles.colorFFF4DE, 
                  style: SignStyle.solid,
                  onTap: onCancel,
                  textColor: Styles.colorFFA800,
                ),
                SizedBox(width: 8.0.w,),
                SecondaryButton(
                  height: ButtonHeight.small, 
                  text: 'Konfirmasi Perjalanan', 
                  color: Styles.color145DB4, 
                  style: SignStyle.solid,
                  onTap: onConfirm,
                )
              ],
            )
          )
        ]
      ),
    );
  }
}
