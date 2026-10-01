import 'package:flutter/material.dart';

class AppAssets {
  AppAssets._();

  // Logos
  static const String logoBlack = 'assets/images/logo_black.png';
  static const String logoWhite = 'assets/images/logo_white.png';
  static const String logoColor = 'assets/images/logo_color.png';

  // Fonts
  static const String fontPrimary = 'Monadi';
  static const String fontSecondary = 'Alhadari';

  /// Returns the appropriate logo based on theme brightness
  static String getLogo(Brightness brightness) {
    return brightness == Brightness.dark ? logoWhite : logoColor;
  }
}
