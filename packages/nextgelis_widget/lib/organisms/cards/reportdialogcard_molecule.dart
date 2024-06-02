import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class ReportDialogCard extends StatelessWidget {
  final Function? onSave, onCancel;
  const ReportDialogCard({Key? key, this.onSave, this.onCancel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0.w)), //this right here
      child: SizedBox(
        height: 166.0.w,
        width: 420.0.w,
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const  BaseContainer(
                width: double.infinity,
                child: Headline3Text('Berita Acara', color: Styles.color102235),
              ),
              //const Title2Text('Catatan Revisi', color: Styles.color102235,),
              SizedBox(height: 24.0.w,),
              /*const InputText(
                hint: 'Catatan',
                line: 7,
              ),*/
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
                      text: 'Simpan', 
                      color: Styles.color145DB4, 
                      style: SignStyle.solid,
                      onTap: onSave,
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
