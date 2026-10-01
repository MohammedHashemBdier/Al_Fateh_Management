import 'package:intl/intl.dart';

class DateTimeFormatter {
  DateTimeFormatter._();

  /// Format date to 'yyyy-MM-dd' (e.g. 2026-10-01)
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  /// Format time to 'HH:mm:ss' or 'hh:mm a'
  static String formatTime(DateTime dateTime, {bool is24Hours = true}) {
    return is24Hours
        ? DateFormat('HH:mm:ss').format(dateTime)
        : DateFormat('hh:mm a').format(dateTime);
  }

  /// Format full datetime
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  }

  /// Get current date formatted for Google Sheets
  static String nowFormattedDate() {
    return formatDate(DateTime.now());
  }

  /// Get current time formatted for Google Sheets
  static String nowFormattedTime() {
    return formatTime(DateTime.now());
  }

  /// Human-friendly relative time (e.g. منذ 5 دقائق / 5 mins ago)
  static String timeAgo(DateTime dateTime, {bool isArabic = true}) {
    final diff = DateTime.now().difference(dateTime);

    if (diff.inSeconds < 60) {
      return isArabic ? 'الآن' : 'Just now';
    } else if (diff.inMinutes < 60) {
      final mins = diff.inMinutes;
      return isArabic ? 'منذ $mins دقيقة' : '$mins mins ago';
    } else if (diff.inHours < 24) {
      final hours = diff.inHours;
      return isArabic ? 'منذ $hours ساعة' : '$hours hrs ago';
    } else if (diff.inDays < 7) {
      final days = diff.inDays;
      return isArabic ? 'منذ $days يوم' : '$days days ago';
    } else {
      return formatDate(dateTime);
    }
  }
}
