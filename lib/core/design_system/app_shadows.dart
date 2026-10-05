import 'package:flutter/material.dart';

/// الظلال الموحدة للتطبيق (Design System Shadows & Elevations)
class AppShadows {
  AppShadows._();

  static const List<BoxShadow> none = [];

  static List<BoxShadow> low(Color shadowColor) => [
    BoxShadow(
      color: shadowColor.withValues(alpha: 0.04),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> regular(Color shadowColor) => [
    BoxShadow(
      color: shadowColor.withValues(alpha: 0.08),
      blurRadius: 10,
      offset: const Offset(0, 3),
    ),
  ];

  static List<BoxShadow> hover(Color primaryColor) => [
    BoxShadow(
      color: primaryColor.withValues(alpha: 0.12),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> high(Color shadowColor) => [
    BoxShadow(
      color: shadowColor.withValues(alpha: 0.16),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> dialog(Color shadowColor) => [
    BoxShadow(
      color: shadowColor.withValues(alpha: 0.24),
      blurRadius: 32,
      offset: const Offset(0, 12),
    ),
  ];
}
