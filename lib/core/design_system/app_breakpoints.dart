import 'package:flutter/material.dart';

/// نقاط توقف الشاشات الموحدة في المنظومة (Adaptive Breakpoints)
class AppBreakpoints {
  const AppBreakpoints._();

  static const double mobileMax = 649.0;
  static const double tabletMin = 650.0;
  static const double tabletMax = 1023.0;
  static const double desktopMin = 1024.0;
  static const double desktopMax = 1439.0;
  static const double largeDesktopMin = 1440.0;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= mobileMax;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= tabletMin && width <= tabletMax;
  }

  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= desktopMin && width <= desktopMax;
  }

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= largeDesktopMin;

  static bool isCompact(BuildContext context) =>
      MediaQuery.sizeOf(context).width < desktopMin;
}
