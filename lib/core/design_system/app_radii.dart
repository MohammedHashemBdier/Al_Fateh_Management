import 'package:flutter/material.dart';

/// ملف الانحناءات الموحدة للتطبيق (Design System Border Radii)
class AppRadii {
  AppRadii._();

  // Numerical Values
  static const double noneValue = 0.0;
  static const double xsValue = 4.0;
  static const double smValue = 8.0;
  static const double mdValue = 12.0;
  static const double lgValue = 16.0;
  static const double xlValue = 20.0;
  static const double xxlValue = 28.0;
  static const double fullValue = 999.0;

  // BorderRadius Instances
  static const BorderRadius none = BorderRadius.zero;
  static const BorderRadius xs = BorderRadius.all(Radius.circular(xsValue));
  static const BorderRadius sm = BorderRadius.all(Radius.circular(smValue));
  static const BorderRadius md = BorderRadius.all(Radius.circular(mdValue));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(lgValue));
  static const BorderRadius xl = BorderRadius.all(Radius.circular(xlValue));
  static const BorderRadius xxl = BorderRadius.all(Radius.circular(xxlValue));
  static const BorderRadius full = BorderRadius.all(Radius.circular(fullValue));

  // Top Only Radii (e.g. for Bottom Sheets or Cards)
  static const BorderRadius topMd = BorderRadius.only(
    topLeft: Radius.circular(mdValue),
    topRight: Radius.circular(mdValue),
  );
  static const BorderRadius topLg = BorderRadius.only(
    topLeft: Radius.circular(lgValue),
    topRight: Radius.circular(lgValue),
  );
  static const BorderRadius topXl = BorderRadius.only(
    topLeft: Radius.circular(xlValue),
    topRight: Radius.circular(xlValue),
  );
}
