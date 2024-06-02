import 'package:flutter/material.dart';
import 'package:gelis/modules/modules.dart';

class Routes {
  static final Map<String, WidgetBuilder> screens = {
    LoginRoute.path: (BuildContext context) => const LoginScreen(),
    HomeRoute.path: (BuildContext context) => HomeScreen(),
    UnknownRoute.path: (BuildContext context) => const UnknownScreen(),
    FieldRoute.path: (BuildContext context) => const FieldScreen(),
    FrontRoute.path: (BuildContext context) => const FrontScreen(),
    WoListRoute.path: (BuildContext context) => const WoListScreen(),
    WoDetailRoute.path: (BuildContext context) => const WoDetailScreen(),
    UserRoute.path: (BuildContext context) => const UserScreen(),
    DataRoute.path: (BuildContext context) => DataScreen(),
    ApproveRoute.path: (BuildContext context) =>  ApproveWoScreen(),
    OnGoingRoute.path: (BuildContext context) => OnGoingScreen(),
    HistoryRoute.path: (BuildContext context) => HistoryScreen(),
    CheckRoute.path: (BuildContext context) => CheckListScreen(),
    ReportRoute.path: (BuildContext context) => ReportScreen(),
    CalendarRoute.path: (BuildContext context) => const CalendarScreen(),
    MapRoute.path: (BuildContext context) => const MapScreen(),
    RevisionRoute.path: (BuildContext context) => RevisionScreen(),
    RevisedRoute.path: (BuildContext context) => RevisedScreen(),
    PrintRoute.path: (BuildContext context) => const PrintScreen(),
    ProcessRoute.path: (BuildContext context) => const ProcessScreen(),
    //NotificationRoute.path: (BuildContext context) => const NotificationScreen(),
    SamplingRoute.path: (BuildContext context) => const SamplingScreen(),
    SupportRoute.path: (BuildContext context) => const SupprtScreen()
  };
}
