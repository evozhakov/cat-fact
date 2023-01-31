import 'package:flutter/material.dart';

class SettingsItemModel {
  final String title;
  final IconData? icon;
  final Function? onTap;
  final Widget? trailing;
  const SettingsItemModel({
    required this.title,
    this.icon,
    this.onTap,
    this.trailing,
  });
}