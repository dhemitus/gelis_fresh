import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class TempDialogCard extends StatelessWidget {
  final Function? onSave, onCancel;
  const TempDialogCard({Key? key, this.onSave, this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0.w)), //this right here
      child: SizedBox(
        height: 396.0.w,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Headline3Text('Suhu Udara', color: Styles.color102235),
              SizedBox(height: 24.0.w,),
              const InputText(
                hint: 'Catatan',
                line: 7,
              ),
              SaveClose(onCancel: onCancel, onSave: onSave,)
            ],
          ),
        ),
      ),
    );
  }
}
