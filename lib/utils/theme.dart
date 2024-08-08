import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2B637B),
      surfaceTint: Color(4283521938),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292796927),
      onPrimaryContainer: Color(4278851147),
      secondary: Color(4286862358),
      onSecondary: Color.fromARGB(255, 71, 63, 63),
      secondaryContainer: Color(4294958268),
      onSecondaryContainer: Color(4281079552),
      tertiary: Color(4282542132),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291030957),
      onTertiaryContainer: Color(4278460672),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color.fromARGB(255, 248, 250, 255),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282795599),
      outline: Color(4285953664),
      outlineVariant: Color(4291216848),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290429951),
      primaryFixed: Color(4292796927),
      onPrimaryFixed: Color(4278851147),
      primaryFixedDim: Color(4290429951),
      onPrimaryFixedVariant: Color(4281942905),
      secondaryFixed: Color(4294958268),
      onSecondaryFixed: Color(4281079552),
      secondaryFixedDim: Color(4294687347),
      onSecondaryFixedVariant: Color(4285021440),
      tertiaryFixed: Color(4291030957),
      onTertiaryFixed: Color(4278460672),
      tertiaryFixedDim: Color(4289188499),
      onTertiaryFixedVariant: Color(4281028382),
      surfaceDim: Color.fromARGB(255, 217, 218, 224),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color.fromARGB(255, 255, 255, 255),
      surfaceContainerLow: Color.fromARGB(255, 242, 245, 250),
      surfaceContainer: Color.fromARGB(255, 237, 238, 244),
      surfaceContainerHigh: Color.fromARGB(255, 231, 233, 239),
      surfaceContainerHighest: Color.fromARGB(255, 225, 227, 233),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281679732),
      surfaceTint: Color(4283521938),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284969386),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284627200),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4288571691),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280765211),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283924296),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282532427),
      outline: Color(4284374631),
      outlineVariant: Color(4286216835),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290429951),
      primaryFixed: Color(4284969386),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283324560),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4288571691),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4286664980),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283924296),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282410290),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293124585),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279377234),
      surfaceTint: Color(4283521938),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281679732),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281670656),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284627200),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278528256),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280765211),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280492843),
      outline: Color(4282532427),
      outlineVariant: Color(4282532427),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4293585663),
      primaryFixed: Color(4281679732),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280166493),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284627200),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282656256),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280765211),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279251974),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293124585),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290429951),
      surfaceTint: Color(4290429951),
      onPrimary: Color(4280429665),
      primaryContainer: Color(4281942905),
      onPrimaryContainer: Color(4292796927),
      secondary: Color(4294687347),
      onSecondary: Color(4282984704),
      secondaryContainer: Color(4285021440),
      onSecondaryContainer: Color(4294958268),
      tertiary: Color(4289188499),
      onTertiary: Color(4279515145),
      tertiaryContainer: Color(4281028382),
      onTertiaryContainer: Color(4291030957),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279374616),
      onSurface: Color(4293124585),
      onSurfaceVariant: Color(4291216848),
      outline: Color(4287664282),
      outlineVariant: Color(4282795599),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124585),
      inversePrimary: Color(4283521938),
      primaryFixed: Color(4292796927),
      onPrimaryFixed: Color(4278851147),
      primaryFixedDim: Color(4290429951),
      onPrimaryFixedVariant: Color(4281942905),
      secondaryFixed: Color(4294958268),
      onSecondaryFixed: Color(4281079552),
      secondaryFixedDim: Color(4294687347),
      onSecondaryFixedVariant: Color(4285021440),
      tertiaryFixed: Color(4291030957),
      onTertiaryFixed: Color(4278460672),
      tertiaryFixedDim: Color(4289188499),
      onTertiaryFixedVariant: Color(4281028382),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290758911),
      surfaceTint: Color(4290429951),
      onPrimary: Color(4278390598),
      primaryContainer: Color(4286811592),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294950520),
      onSecondary: Color(4280553984),
      secondaryContainer: Color(4290676036),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289451927),
      onTertiary: Color(4278393600),
      tertiaryContainer: Color(4285766754),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374616),
      onSurface: Color(4294834943),
      onSurfaceVariant: Color(4291545812),
      outline: Color(4288848556),
      outlineVariant: Color(4286743180),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124585),
      inversePrimary: Color(4282008698),
      primaryFixed: Color(4292796927),
      onPrimaryFixed: Color(4278192447),
      primaryFixedDim: Color(4290429951),
      onPrimaryFixedVariant: Color(4280824423),
      secondaryFixed: Color(4294958268),
      onSecondaryFixed: Color(4280093952),
      secondaryFixedDim: Color(4294687347),
      onSecondaryFixedVariant: Color(4283510272),
      tertiaryFixed: Color(4291030957),
      onTertiaryFixed: Color(4278326528),
      tertiaryFixedDim: Color(4289188499),
      onTertiaryFixedVariant: Color(4279909903),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294834943),
      surfaceTint: Color(4290429951),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290758911),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966008),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294950520),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294115302),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289451927),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374616),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294834943),
      outline: Color(4291545812),
      outlineVariant: Color(4291545812),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124585),
      inversePrimary: Color(4279969114),
      primaryFixed: Color(4293125631),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290758911),
      onPrimaryFixedVariant: Color(4278390598),
      secondaryFixed: Color(4294959815),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294950520),
      onSecondaryFixedVariant: Color(4280553984),
      tertiaryFixed: Color(4291294129),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289451927),
      onTertiaryFixedVariant: Color(4278393600),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
