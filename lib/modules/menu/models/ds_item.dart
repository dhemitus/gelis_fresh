import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DsItem extends Equatable {
  final String? label, route;
  final Widget? icon;

  const DsItem({this.label, this.route, this.icon});

  DsItem copyWith({
    String? label, route,
    Widget? icon
  }) => DsItem(
    label: label ?? this.label,
    route: route ?? this.route,
    icon: icon ?? this.icon
  );

  factory DsItem.fromMap(Map<String, dynamic> m) => DsItem(
    label: m['label'] ?? '',
    route: m['route'] ?? '',
    icon: m['icon'] ?? Container()
  );

  @override
  List<Object?> get props => [label, route, icon];
}
