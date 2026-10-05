/// الفئة الأساسية لجميع استثناءات المنظومة مع رسائل وأكواد خطأ موحدة
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const AppException(this.message, {this.code, this.details});

  @override
  String toString() => message;
}

/// خطأ في الاتصال بالشبكة أو انقطاع الإنترنت
class NetworkException extends AppException {
  const NetworkException([
    super.message = 'error_network_connection',
    String? code = 'NET_001',
  ]) : super(code: code);
}

/// انتهاء مهلة الاتصال بالخادم
class TimeoutException extends AppException {
  const TimeoutException([
    super.message = 'error_network_timeout',
    String? code = 'NET_002',
  ]) : super(code: code);
}

/// خطأ داخلي في الخادم أو استجابة غير صالحة من Google Apps Script
class ServerException extends AppException {
  const ServerException([
    super.message = 'error_server_internal',
    String? code = 'SRV_001',
    dynamic details,
  ]) : super(code: code, details: details);
}

/// خطأ في المصادقة أو انتهاء صلاحية الجلسة (401)
class UnauthorizedException extends AppException {
  const UnauthorizedException([
    super.message = 'error_unauthorized',
    String? code = 'AUTH_401',
  ]) : super(code: code);
}

/// الحساب لا يملك الصلاحيات الكافية لتنفيذ العملية (403)
class ForbiddenException extends AppException {
  const ForbiddenException([
    super.message = 'error_forbidden',
    String? code = 'AUTH_403',
  ]) : super(code: code);
}

/// العنصر أو السجل المطلوب غير موجود (404)
class NotFoundException extends AppException {
  const NotFoundException([
    super.message = 'error_not_found',
    String? code = 'RES_404',
  ]) : super(code: code);
}

/// عدم صحة البيانات المدخلة في الحقول
class ValidationException extends AppException {
  const ValidationException([
    super.message = 'error_validation_failed',
    String? code = 'VAL_001',
  ]) : super(code: code);
}

/// خطأ في قراءة أو كتابة التخزين المحلي المشفر
class CacheException extends AppException {
  const CacheException([
    super.message = 'error_cache_failure',
    String? code = 'CACHE_001',
  ]) : super(code: code);
}

/// خطأ غير متوقع
class UnknownException extends AppException {
  const UnknownException([
    super.message = 'error_unknown',
    String? code = 'UNK_000',
    dynamic details,
  ]) : super(code: code, details: details);
}
