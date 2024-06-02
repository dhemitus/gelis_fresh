import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {

  static initSystem() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent
    ));
    WidgetsFlutterBinding.ensureInitialized();
  }
}
