import 'package:flutter/material.dart';

class NavigationItem {
  final int idx;
  final String title;
  final IconData icon;
  final Function() onTap;

  NavigationItem(
      {required this.idx,
      required this.title,
      required this.icon,
      required this.onTap});
}
