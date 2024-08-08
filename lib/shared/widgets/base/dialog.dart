import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/context_x.dart';
import 'package:km_test_suitmedia_resmaadi/core/extensions/gap_x.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'screen.dart';

extension DialogAlert on BuildContext {
  void showDialog({String? title, required List<Widget> children}) {
    Alert(
      context: this,
      style: AlertStyle(
          backgroundColor: colorScheme.surfaceContainerLowest,
          isCloseButton: false,
          isButtonVisible: false,
          alertBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          buttonAreaPadding: EdgeInsets.all(10.w)),
      content: SizedBox(
        width: RsScreen.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (title != null) ...[
            16.gH,
            Center(
              child: Text(
                title,
                style: textTheme.displaySmall!.copyWith(fontSize: 14.sp),
              ),
            ),
            16.gH,
          ],
          ...children
        ]),
      ),
    ).show();
  }
}
