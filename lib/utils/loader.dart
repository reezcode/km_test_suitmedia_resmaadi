import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';

class Loader {
  static void init(BuildContext context) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.ripple
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = context.colorScheme.primary
      ..backgroundColor = context.colorScheme.surfaceContainerLowest
      ..indicatorColor = context.colorScheme.primary
      ..textColor = Colors.white
      ..maskType = EasyLoadingMaskType.black
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = true
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..dismissOnTap = false;
  }
}
