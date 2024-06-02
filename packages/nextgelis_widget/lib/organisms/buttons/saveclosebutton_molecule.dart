import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class SaveClose extends StatelessWidget {
  final Function? onSave, onCancel;
  const SaveClose({Key? key, this.onSave, this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            text: 'Simpan', 
            color: Styles.color145DB4, 
            style: SignStyle.solid,
            onTap: onSave,
          )
        ],
      )
    );
  }
}
