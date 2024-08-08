import 'package:flutter/material.dart';

class RsScreen {
  static double get w =>
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
  static double get h => WidgetsBinding
      .instance.platformDispatcher.views.first.physicalSize.height;
}
