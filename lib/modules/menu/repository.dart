import 'dart:async';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';
List<Map<String, dynamic>> _menu = [
  {
  'icon': approve,
  'label': 'Approve WO',
  'route': ApproveRoute.path
  },{
  'icon': checklist,
  'label': 'Checklist WO',
  'route': CheckRoute.path
  },{
  'icon': ongoing,
  'label': 'Ongoing WO',
  'route': OnGoingRoute.path
  },{
  'icon': revision,
  'label': 'Revision Req',
  'route': RevisionRoute.path
  },{
  'icon': revised,
  'label': 'Revised',
  'route': RevisedRoute.path
  },{
  'icon': report,
  'label': 'Report',
  'route': ReportRoute.path
  },{
  'icon': calendar,
  'label': 'Calendar',
  'route': CalendarRoute.path
  },{
  'icon': others,
  'label': 'Others',
  'route': null
  },
];

class MenuListRepository {
  List<DsItem>? _m;
  Future<List<DsItem>> loadDashboardMenu() async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () {
        _m = [];
        _menu.map((Map<String, dynamic> e) => _m!.add(DsItem.fromMap(e))).toList();
        return _m!;
      }
    );
  }
}
