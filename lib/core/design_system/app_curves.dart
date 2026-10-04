import 'package:flutter/material.dart';

/// منحنيات الأنميشن الموحدة للتطبيق (Design System Motion Curves)
class AppCurves {
  AppCurves._();

  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;

  // Modern Cubic Curves
  static const Curve expressive = Curves.easeOutCubic;
  static const Curve entrance = Curves.easeOutBack;
  static const Curve exit = Curves.easeInCubic;
  static const Curve gentle = Curves.fastOutSlowIn;
  static const Curve bounce = Curves.elasticOut;
}
