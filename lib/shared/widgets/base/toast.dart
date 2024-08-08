import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class RsToast {
  static void show(ToastificationType type, String title, String message) {
    toastification.show(
        type: type,
        style: ToastificationStyle.flat,
        autoCloseDuration: const Duration(seconds: 5),
        title: Text(title),
        description: Text(message));
  }
}
