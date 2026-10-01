import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

extension ContextExtensions on BuildContext {
  // Theme & Colors
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  bool get isDark => theme.brightness == Brightness.dark;

  // Localization
  AppLocalizations get loc => AppLocalizations.of(this);
  String tr(String key) => loc.translate(key);
  bool get isArabic => loc.isArabic;

  // Media Query & Screen Dimensions
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  // Responsive Breakpoints
  bool get isMobile => screenWidth < 650;
  bool get isTablet => screenWidth >= 650 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;
  bool get isWideDesktop => screenWidth >= 1440;

  // Navigation
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);
}
