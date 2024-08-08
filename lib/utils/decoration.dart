import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';
import 'package:remixicon/remixicon.dart';

import '../core/services/context.dart';

class RsInputDecoration {
  static InputDecoration defaultDecoration({
    String? hint,
    String? label,
    IconData? icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: appContext?.textTheme.bodyMedium!
          .copyWith(color: appContext?.colorScheme.outlineVariant),
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: appContext?.colorScheme.outlineVariant,
            )
          : null,
      contentPadding: EdgeInsets.all(16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: appContext!.colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
    );
  }

  static InputDecoration dateDecoration({
    String? hint,
    String? label,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: appContext?.textTheme.bodyMedium!
          .copyWith(color: appContext?.colorScheme.outlineVariant),
      suffixIcon: Icon(
        Remix.calendar_check_line,
        color: appContext?.colorScheme.outline,
      ),
      contentPadding: EdgeInsets.all(16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: appContext!.colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
    );
  }

  static InputDecoration dropdownRoundedDecoration({
    String? hint,
    String? label,
    IconData? icon,
  }) {
    return InputDecoration(
      prefixIcon: icon != null
          ? Container(
              width: 50.w,
              margin: EdgeInsets.only(left: 2),
              decoration: BoxDecoration(
                  color: appContext!.colorScheme.surfaceContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                  )),
              padding: EdgeInsets.only(
                  left: 12.w, right: 8.w), // Adjust padding as needed
              child: Center(
                child: Icon(
                  icon,
                  color: appContext?.colorScheme.outline,
                ),
              ),
            )
          : null,
      contentPadding:
          EdgeInsets.symmetric(vertical: 12.w), // Adjust padding as needed
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
    );
  }

  static InputDecoration dropdownDecoration({
    String? hint,
    String? label,
    IconData? icon,
  }) {
    return InputDecoration(
      contentPadding:
          EdgeInsets.symmetric(vertical: 16.w), // Adjust padding as needed
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
    );
  }

  static InputDecoration filledDecoration({
    String? hint,
    String? label,
    IconData? icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: appContext?.textTheme.bodyMedium!
          .copyWith(color: appContext?.colorScheme.outlineVariant),
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: appContext?.colorScheme.onSurfaceVariant,
            )
          : null,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.all(16.w),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: appContext!.colorScheme.primary),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
    );
  }

  static InputDecoration filledRoundedDecoration({
    String? hint,
    String? label,
    IconData? icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: appContext?.textTheme.bodyMedium!
          .copyWith(color: appContext?.colorScheme.outlineVariant),
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: appContext?.colorScheme.onSurfaceVariant,
            )
          : null,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.all(16.w),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(color: appContext!.colorScheme.primary),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
    );
  }

  static InputDecoration passwordDecoration({
    String? hint,
    String? label,
    bool? isObscure,
    void Function()? onObscurePressed,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: appContext?.textTheme.bodyMedium!
          .copyWith(color: appContext?.colorScheme.outlineVariant),
      prefixIcon: Icon(
        TablerIcons.lock,
        color: appContext?.colorScheme.outlineVariant,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: appContext!.colorScheme.primary),
      ),
      suffixIcon: IconButton(
        icon: Icon(
          isObscure! ? Icons.visibility : Icons.visibility_off,
          color: appContext?.colorScheme.outlineVariant,
        ),
        onPressed: onObscurePressed,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
    );
  }

  static InputDecoration passwordFiiledDecoration({
    String? hint,
    String? label,
    bool? isObscure,
    void Function()? onObscurePressed,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: appContext?.textTheme.bodyMedium!
          .copyWith(color: appContext?.colorScheme.outlineVariant),
      prefixIcon: Icon(
        TablerIcons.lock,
        color: appContext?.colorScheme.onSurfaceVariant,
      ),
      fillColor: Colors.white,
      contentPadding: EdgeInsets.all(16.w),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: appContext!.colorScheme.primary),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      suffixIcon: IconButton(
        icon: Icon(
          isObscure! ? Icons.visibility : Icons.visibility_off,
          color: appContext?.colorScheme.onSurfaceVariant,
        ),
        onPressed: onObscurePressed,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:
            BorderSide(color: appContext!.colorScheme.surfaceContainerHighest),
      ),
    );
  }
}
