import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class TopTabItem extends Equatable {
  final String? label;
  final Widget? icon, disableIcon;
  final int? id;

  const TopTabItem({this.label, this.icon, this.disableIcon, this.id});

  @override
  List<Object?> get props => [label, icon, disableIcon, id];

}
