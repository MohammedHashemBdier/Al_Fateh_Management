import 'package:flutter/material.dart';
import '../constants/app_assets.dart';

/// الأنماط الطباعية الموحدة للتطبيق (Design System Typography)
class AppTypography {
  AppTypography._();

  // Display Styles (العناوين الضخمة وشاشات البداية)
  static TextStyle displayLarge({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontSecondary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        height: 1.25,
        color: color,
      );

  static TextStyle displayMedium({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontSecondary,
        fontSize: 26,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: color,
      );

  // Headings & Titles (عناوين الصفحات والأقسام)
  static TextStyle headline({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontSecondary,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: color,
      );

  static TextStyle titleLarge({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontSecondary,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.35,
        color: color,
      );

  static TextStyle titleMedium({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: color,
      );

  static TextStyle titleSmall({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: color,
      );

  // Body Styles (النصوص العادية والتفاصيل)
  static TextStyle bodyLarge({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 15,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: color,
      );

  static TextStyle bodyMedium({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 13,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: color,
      );

  static TextStyle bodySmall({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.45,
        color: color,
      );

  // Labels & Buttons (الأزرار والبادجات)
  static TextStyle labelLarge({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: color,
      );

  static TextStyle labelMedium({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: color,
      );

  static TextStyle labelSmall({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: color,
      );

  // Caption & Overline
  static TextStyle caption({Color? color}) => TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontSize: 11,
        fontWeight: FontWeight.normal,
        height: 1.3,
        color: color,
      );
}
