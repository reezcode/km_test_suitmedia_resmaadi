import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme =
      GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);

  TextStyle mediumTextStyle =
      GoogleFonts.getFont(bodyFontString, fontWeight: FontWeight.w500);
  TextStyle semiBoldStyle =
      GoogleFonts.getFont(bodyFontString, fontWeight: FontWeight.w600);
  TextStyle boldStyle =
      GoogleFonts.getFont(bodyFontString, fontWeight: FontWeight.w700);
  TextStyle extraBoldStyle =
      GoogleFonts.getFont(bodyFontString, fontWeight: FontWeight.w800);

  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
    headlineMedium: mediumTextStyle,
    // Add the new styles here
    displaySmall: semiBoldStyle,
    displayMedium: boldStyle,
    displayLarge: extraBoldStyle,
  );

  return textTheme;
}
