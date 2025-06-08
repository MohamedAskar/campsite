import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class AppTheme {
  final TextTheme textTheme;

  const AppTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff36618e),
      surfaceTint: Color(0xff36618e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd2e4ff),
      onPrimaryContainer: Color(0xff1a4975),
      secondary: Color(0xff535f70),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd7e3f8),
      onSecondaryContainer: Color(0xff3c4858),
      tertiary: Color(0xff6b5778),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xfff3daff),
      onTertiaryContainer: Color(0xff533f5f),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff43474e),
      outline: Color(0xffd8dae0),
      outlineVariant: Color(0xffc3c6cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3135),
      inversePrimary: Color(0xffa1cafd),
      primaryFixed: Color(0xffd2e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xffa1cafd),
      onPrimaryFixedVariant: Color(0xff1a4975),
      secondaryFixed: Color(0xffd7e3f8),
      onSecondaryFixed: Color(0xff101c2b),
      secondaryFixedDim: Color(0xffbbc7db),
      onSecondaryFixedVariant: Color(0xff3c4858),
      tertiaryFixed: Color(0xfff3daff),
      onTertiaryFixed: Color(0xff251431),
      tertiaryFixedDim: Color(0xffd7bee4),
      onTertiaryFixedVariant: Color(0xff533f5f),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffeceef4),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe1e2e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa1cafd),
      surfaceTint: Color(0xffa1cafd),
      onPrimary: Color(0xff003259),
      primaryContainer: Color(0xff1a4975),
      onPrimaryContainer: Color(0xffd2e4ff),
      secondary: Color(0xffbbc7db),
      onSecondary: Color(0xff253140),
      secondaryContainer: Color(0xff3c4858),
      onSecondaryContainer: Color(0xffd7e3f8),
      tertiary: Color(0xffd7bee4),
      onTertiary: Color(0xff3b2947),
      tertiaryContainer: Color(0xff533f5f),
      onTertiaryContainer: Color(0xfff3daff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111418),
      onSurface: Color(0xffe1e2e8),
      onSurfaceVariant: Color(0xffc3c6cf),
      outline: Color(0xff8d9199),
      outlineVariant: Color(0xff43474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e8),
      inversePrimary: Color(0xff36618e),
      primaryFixed: Color(0xffd2e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xffa1cafd),
      onPrimaryFixedVariant: Color(0xff1a4975),
      secondaryFixed: Color(0xffd7e3f8),
      onSecondaryFixed: Color(0xff101c2b),
      secondaryFixedDim: Color(0xffbbc7db),
      onSecondaryFixedVariant: Color(0xff3c4858),
      tertiaryFixed: Color(0xfff3daff),
      onTertiaryFixed: Color(0xff251431),
      tertiaryFixedDim: Color(0xffd7bee4),
      onTertiaryFixedVariant: Color(0xff533f5f),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff36393e),
      surfaceContainerLowest: Color(0xff0b0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    iconTheme: IconThemeData(
      color: colorScheme.onSurface,
    ),
  );

  static TextTheme createTextTheme(
    BuildContext context,
    String fontFamily,
  ) {
    TextTheme baseTextTheme = Theme.of(context).textTheme;
    TextTheme textTheme = GoogleFonts.getTextTheme(
      fontFamily,
      baseTextTheme,
    );
    return textTheme;
  }
}
