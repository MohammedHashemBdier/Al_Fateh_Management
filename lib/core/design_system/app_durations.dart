/// مدد الأنميشن الموحدة للتطبيق (Design System Motion Durations)
class AppDurations {
  AppDurations._();

  static const Duration instant = Duration.zero;
  static const Duration fastest = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 400);
  static const Duration slow = Duration(milliseconds: 600);
  static const Duration slower = Duration(milliseconds: 800);
  static const Duration splash = Duration(milliseconds: 1200);

  // Stagger Steps
  static const Duration staggerFast = Duration(milliseconds: 35);
  static const Duration staggerNormal = Duration(milliseconds: 50);
  static const Duration staggerSlow = Duration(milliseconds: 80);
}
