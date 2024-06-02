import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {

  /*
  static const Color color3B4958 = Color(0xFF3B4958);
  static const Color color66717C = Color(0xFF66717C);
  static const Color color90979E = Color(0xFF90979E);
  static const Color colorE5E5E5 = Color(0xFFE5E5E5);
  static const Color color0066FF = Color(0xFF0066FF);
  static const Color color00D1FF = Color(0xFF00D1FF);
  static const Color color2144FD = Color(0xFF2144FD);
  static const Color color006FB0 = Color(0xFF006FB0);
  static const Color color01ADFB = Color(0xFF01ADFB);
  static const Color color2E87BB = Color(0xFF2E87BB);
  static const Color colorB7DAE9 = Color(0xFFB7DAE9);
  static const Color colorBABEC2 = Color(0xFFBABEC2);
  static const Color colorF5F5F5 = Color(0xFFF5F5F5);
  static const Color color43936C = Color(0xFF43936C);
  static const Color colorBD251C = Color(0xFFBD251C);
  static const Color colorCB3A31 = Color(0xFFCB3A31);
  static const Color colorD99B30 = Color(0xFFD99B30);*/

  //grey
  static const Color color5C5C5C = Color(0xFF5C5C5C);
  static const Color color6A6A6A = Color(0xFF6A6A6A);
  static const Color color848484 = Color(0xFF848484);
  static const Color colorC0C0C0 = Color(0xFFC0C0C0);
  static const Color colorC5C5C5 = Color(0xFFC5C5C5);
  static const Color colorD8D8D8 = Color(0xFFD8D8D8);

  //mixgrey
  static const Color color102235 = Color(0xFF102235);
  static const Color color3B4958 = Color(0xFF3B4958);
  static const Color color66717C = Color(0xFF66717C);
  static const Color color90979E = Color(0xFF90979E);
  static const Color colorBABEC2 = Color(0xFFBABEC2);
  static const Color colorD1D2D4 = Color(0xFFD1D2D4);
  static const Color colorDBDFED = Color(0xFFDBDFED);

  //blue
  static const Color color053978 = Color(0xFF053978);
  static const Color color06438B = Color(0xFF06438B);
  static const Color color0A58B4 = Color(0xFF0A58B4);
  static const Color color0777E8 = Color(0xFF0777E8);
  static const Color color145DB4 = Color(0xFF145DB4);
  static const Color color0C62A0 = Color(0xFF0C62A0);
  static const Color color006FB0 = Color(0xFF006FB0);
  static const Color color4d91dc = Color(0xFF4d91dc);
  static const Color color2FB8F7 = Color(0xFF2FB8F7);
  static const Color color209FE7 = Color(0xFF209FE7);
  static const Color color81BAF1 = Color(0xFF81BAF1);
  static const Color colorD1E6FF = Color(0xFFD1E6FF);
  static const Color colorD6EEFF = Color(0xFFD6EEFF);
  static const Color colorEAF9FF = Color(0xFFEAF9FF);

  //redorange
  static const Color colorBD251C = Color(0xFFBD251C);
  static const Color colorD30000 = Color(0xFFD30000);
  static const Color colorF8D7D7 = Color(0xFFF8D7D7);
  static const Color colorE55604 = Color(0xFFE55604);
  static const Color colorFB8500 = Color(0xFFFB8500);
  static const Color colorFFA800 = Color(0xFFFFA800);
  static const Color colorFFB703 = Color(0xFFFFB703);
  static const Color colorFBBF24 = Color(0xFFFBBF24);
  static const Color colorFFF4DE = Color(0xFFFFF4DE);

  //bluegreen
  static const Color color0025CE = Color(0xFF0025CE);
  static const Color color2144FD = Color(0xFF2144FD);
  static const Color color00EAFF = Color(0xFF00EAFF);
  static const Color color0CA016 = Color(0xFF0CA016);
  static const Color color23C033 = Color(0xFF23C033);
  static const Color color3680C8 = Color(0XFF3680C8);
  static const Color colorD6FFDC = Color(0xFFD6FFDC);

  static final TextStyle text24W900 = TextStyle(
      fontFamily: 'MetropolisBold',
      fontSize: 24.0.sp,
      letterSpacing: -1.5.sp,
      fontWeight: FontWeight.w700,
      color: Styles.color6A6A6A
  );

  static final TextStyle text24W600 = TextStyle(
      fontFamily: 'MetropolisSemiBold',
      fontSize: 24.0.sp,
      letterSpacing: -1.5.sp,
      fontWeight: FontWeight.w600,
      color: Styles.color6A6A6A
  );

  static final TextStyle text16W700 = TextStyle(
      fontFamily: 'MetropolisSemiBold',
      fontSize: 16.0.sp,
      letterSpacing: 0.2.sp,
      fontWeight: FontWeight.w700,
      color: Styles.color6A6A6A
  );

  static final TextStyle text16W600 = TextStyle(
      fontFamily: 'MetropolisMedium',
      fontSize: 16.0.sp,
      letterSpacing: 0.2.sp,
      fontWeight: FontWeight.w600,
      color: Styles.color6A6A6A
  );

  static final TextStyle text14W700 = TextStyle(
      fontFamily: 'MetropolisSemiBold',
      fontSize: 14.0.sp,
      letterSpacing: 0.2.sp,
      fontWeight: FontWeight.w700,
      color: Styles.color6A6A6A
  );

  static final TextStyle text14W600 = TextStyle(
      fontFamily: 'MetropolisMedium',
      fontSize: 14.0.sp,
      letterSpacing: 0.2.sp,
      fontWeight: FontWeight.w600,
      color: Styles.color6A6A6A
  );

  static final TextStyle text12W700 = TextStyle(
      fontFamily: 'MetropolisSemiBold',
      fontSize: 12.0.sp,
      letterSpacing: 0.5.sp,
      fontWeight: FontWeight.w700,
      color: Styles.color6A6A6A
  );

  static final TextStyle text12W600 = TextStyle(
      fontFamily: 'MetropolisMedium',
      fontSize: 12.0.sp,
      letterSpacing: 0.5.sp,
      fontWeight: FontWeight.w600,
      color: Styles.color6A6A6A
  );

  static final TextStyle text12W400 = TextStyle(
      fontFamily: 'MetropolisRegular',
      fontSize: 12.0.sp,
      letterSpacing: 0.5.sp,
      fontWeight: FontWeight.w400,
      color: Styles.color6A6A6A
  );

  static final TextStyle text10W400 = TextStyle(
      fontFamily: 'MetropolisRegular',
      fontSize: 10.0.sp,
      letterSpacing: 0.5.sp,
      fontWeight: FontWeight.w400,
      color: Styles.color6A6A6A
  );

  static final TextStyle text8W400 = TextStyle(
      fontFamily: 'MetropolisRegular',
      fontSize: 8.0.sp,
      letterSpacing: 0.5.sp,
      fontWeight: FontWeight.w400,
      color: Styles.color6A6A6A
  );
}
