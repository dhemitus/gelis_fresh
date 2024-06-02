import 'dart:async';
import 'package:nextgelis_widget/nextgelis_widget.dart';
import 'package:gelis/modules/modules.dart';

List<Map<String, dynamic>> _crumb = [
  {
    'icon': mapLocation,
    'activeIcon': activeMapLocation,
    'label': 'K Lapangan',
    'route': 0,
    'active': true,
  },
  {
    'icon': flaskConical,
    'activeIcon': activeFlaskConical,
    'label': 'P Lapangan',
    'route': 1,
    'active': false,
  },
  {
    'icon': pippets,
    'activeIcon': activePippets,
    'label': 'Sampling',
    'route': 2,
    'active': false
  }
];

class CrumbRepository {
  List<CrumbItem>? _m;
  Future<List<CrumbItem>> loadCrumbMenu() async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () {
        _m = [];
        _crumb.map((Map<String, dynamic> e) => _m!.add(CrumbItem.fromMap(e))).toList();
        return _m!;
      }
    );
  }
}
