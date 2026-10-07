import '../errors/app_exception.dart';
import '../errors/failure.dart';

/// محول أخطاء الحضور الموحد لمطابقة رموز أخطاء API Contract v5.0 وترجمتها
class AttendanceErrorMapper {
  AttendanceErrorMapper._();

  static String mapFailure(Failure failure, {bool isArabic = true}) {
    final code = failure.code;
    final message = failure.messageKey;

    if (code != null) {
      final mapped = _mapCode(code, isArabic);
      if (mapped != null) return mapped;
    }

    if (message.trim().isNotEmpty && !message.startsWith('error_')) {
      return message;
    }
    return isArabic ? 'حدث خطأ غير متوقع' : 'An unexpected error occurred';
  }

  static String mapException(dynamic error, {bool isArabic = true}) {
    if (error is Failure) {
      return mapFailure(error, isArabic: isArabic);
    }
    if (error is AppException) {
      if (error.code != null) {
        final mapped = _mapCode(error.code!, isArabic);
        if (mapped != null) return mapped;
      }
      return error.message;
    }
    final str = error.toString();
    if (str.contains('MOCK_LOCATION_DETECTED')) {
      return isArabic
          ? 'تم اكتشاف تزييف بالموقع الجغرافي (Mock GPS)، تم حظر التسجيل'
          : 'Fake GPS detected (Mock GPS), check-in blocked';
    }
    if (str.contains('GEOFENCE_OUT_OF_BOUNDS')) {
      return isArabic
          ? 'أنت خارج النطاق الجغرافي المسموح لمقر الشركة'
          : 'You are outside the company geofence radius';
    }
    if (str.contains('POOR_GPS_ACCURACY')) {
      return isArabic
          ? 'دقة الـ GPS غير كافية، يرجى تفعيل الموقع عالي الدقة'
          : 'GPS accuracy is poor, please enable high-accuracy location';
    }
    return str;
  }

  static String? _mapCode(String code, bool isArabic) {
    switch (code) {
      case 'MOCK_LOCATION_DETECTED':
        return isArabic
            ? 'تم اكتشاف تزييف بالموقع الجغرافي (Mock GPS)، تم حظر التسجيل'
            : 'Fake GPS detected (Mock GPS), check-in blocked';
      case 'GEOFENCE_OUT_OF_BOUNDS':
        return isArabic
            ? 'أنت خارج النطاق الجغرافي المسموح لمقر الشركة'
            : 'You are outside the company geofence radius';
      case 'POOR_GPS_ACCURACY':
        return isArabic
            ? 'دقة الـ GPS غير كافية، يرجى تفعيل الموقع عالي الدقة'
            : 'GPS accuracy is poor, please enable high-accuracy location';
      case 'ALREADY_CHECKED_IN':
        return isArabic
            ? 'لقد قمت بتسجيل الحضور مسبقاً لهذا اليوم'
            : 'You have already checked in for today';
      case 'NOT_CHECKED_IN':
        return isArabic
            ? 'لا يمكن تسجيل الانصراف لعدم وجود تسجيل حضور مسجل اليوم'
            : 'Cannot check out: No active check-in recorded for today';
      case 'PAYROLL_PERIOD_LOCKED':
        return isArabic
            ? 'تم إقفال هذا الشهر المالي من قبل الإدارة المالية ولا يمكن التعديل'
            : 'Payroll period is locked by finance, modifications disabled';
      case 'UNAUTHORIZED':
        return isArabic
            ? 'ليس لديك الصلاحية الكافية لإتمام هذا الإجراء'
            : 'You do not have permission to perform this action';
      case 'LOCK_TIMEOUT':
        return isArabic
            ? 'الخادم مشغول حالياً، يرجى إعادة المحاولة بعد ثوانٍ'
            : 'Server lock timeout, please retry in a few seconds';
      case 'ACTION_NOT_FOUND':
        return isArabic
            ? 'الإجراء المطلوب غير مدعوم في النظام'
            : 'Requested action is not supported';
      default:
        return null;
    }
  }
}
