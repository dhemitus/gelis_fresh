import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nextgelis_widget/nextgelis_widget.dart';

class LogoutDialogCard extends StatelessWidget {
  final Function? onOut, onCancel;
  const LogoutDialogCard({Key? key, this.onOut, this.onCancel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Styles.color0A58B4,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0.w)), //this right here
      child: SizedBox(
        height: 200.0.w,
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Headline3Text('Logout', color: Colors.white,),
              const Title2Text('Are you sure, you want to log out?', color: Styles.colorDBDFED,),
              SizedBox(height: 24.0.w,),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(text: 'Cancel', onTap: onCancel, color: Styles.color81BAF1),
                  ),
                  SizedBox(width: 8.0.w,),
                  Expanded(
                    child: PrimaryButton(text: 'Logout', onTap: onOut, color: Styles.color053978,)
                  )
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
