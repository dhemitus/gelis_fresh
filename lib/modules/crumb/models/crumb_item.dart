import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CrumbItem extends Equatable {
  final String? label;
  final int? route;
  final Widget? icon, activeIcon;
  final bool? active;

  const CrumbItem({this.label, this.route, this.icon, this.activeIcon, this.active});

  CrumbItem copyWith({
    String? label,
    int? route,
    Widget? icon, activeIcon,
    bool? active
  }) => CrumbItem(
    label: label ?? this.label,
    route: route ?? this.route,
    icon: icon ?? this.icon,
    activeIcon: activeIcon ?? this.activeIcon,
    active: active ?? this.active
  );

  factory CrumbItem.fromMap(Map<String, dynamic> m) => CrumbItem(
    label: m['label'] ?? '',
    route: m['route'] ?? '',
    icon: m['icon'] ?? Container(),
    activeIcon: m['activeIcon'] ?? Container(),
    active: m['active'] ?? false
  );

  @override
  List<Object?> get props => [label, route, icon, activeIcon, active];
}
