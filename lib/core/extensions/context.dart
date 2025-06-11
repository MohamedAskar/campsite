import 'package:campsite/core/constants/breakpoints.dart';
import 'package:campsite/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  bool get isMobile => width < Breakpoints.mobileBreakpoint;

  bool get isTablet =>
      width >= Breakpoints.mobileBreakpoint &&
      width < Breakpoints.desktopBreakpoint;

  bool get isDesktop => width >= Breakpoints.desktopBreakpoint;

  double get deviceAspectRatio => width / height;
}
