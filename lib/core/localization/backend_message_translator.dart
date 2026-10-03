import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'app_localizations.dart';

/// محرك الترجمة الذكي الشامل لرسائل وأخطاء الباك إند (Google Apps Script / API / Exceptions)
/// يضمن ترجمة كافة الرسائل والأخطاء القادمة حالياً أو مستقبلاً بين العربية والإنجليزية تلقائياً.
class BackendMessageTranslator {
  BackendMessageTranslator._();

  /// قاموس المصطلحات والرسائل ثنائي اللغة (AR <-> EN)
  static final List<_MessageEntry> _dictionary = [
    // -------------------------------------------------------------
    // 1. المصادقة والمستخدمين (Authentication & Users)
    // -------------------------------------------------------------
    _MessageEntry(
      key: 'auth_empty_fields',
      ar: 'يرجى إدخال اسم المستخدم وكلمة المرور',
      en: 'Please enter username and password',
      keywords: ['اسم المستخدم وكلمة المرور', 'username and password', 'empty_fields', 'val_username_empty'],
    ),
    _MessageEntry(
      key: 'auth_invalid_password',
      ar: 'كلمة المرور غير صحيحة',
      en: 'Incorrect password',
      keywords: ['كلمة المرور غير صحيحة', 'incorrect password', 'wrong password', 'invalid_password'],
    ),
    _MessageEntry(
      key: 'auth_user_not_found',
      ar: 'اسم المستخدم غير موجود',
      en: 'Username not found',
      keywords: ['اسم المستخدم غير موجود', 'user not found', 'username not found', 'user_not_found'],
    ),
    _MessageEntry(
      key: 'auth_account_disabled',
      ar: 'تم تعطيل هذا الحساب، يرجى مراجعة إدارة الفتح',
      en: 'This account has been disabled, please contact Al-Fateh admin',
      keywords: ['تعطيل هذا الحساب', 'account disabled', 'account has been disabled', 'account_disabled'],
    ),
    _MessageEntry(
      key: 'auth_login_success',
      ar: 'تم تسجيل الدخول بنجاح',
      en: 'Logged in successfully',
      keywords: ['تسجيل الدخول بنجاح', 'logged in successfully', 'login success', 'auth_success'],
    ),
    _MessageEntry(
      key: 'auth_login_failed',
      ar: 'فشل تسجيل الدخول، يرجى التحقق من اسم المستخدم وكلمة المرور',
      en: 'Login failed, please check your credentials and try again',
      keywords: ['فشل تسجيل الدخول', 'login failed', 'authentication failed', 'auth_failed'],
    ),
    _MessageEntry(
      key: 'auth_logout_success',
      ar: 'تم تسجيل الخروج بنجاح',
      en: 'Signed out successfully',
      keywords: ['تسجيل الخروج بنجاح', 'logged out', 'signed out successfully'],
    ),
    _MessageEntry(
      key: 'auth_session_expired',
      ar: 'انتهت الجلسة، يرجى تسجيل الدخول مجدداً',
      en: 'Session expired, please sign in again',
      keywords: ['انتهت الجلسة', 'session expired', 'token expired'],
    ),
    _MessageEntry(
      key: 'auth_permission_denied',
      ar: 'ليس لديك الصلاحية لتنفيذ هذا الإجراء',
      en: 'You do not have permission to perform this action',
      keywords: ['ليس لديك الصلاحية', 'permission denied', 'access denied', 'unauthorized', 'forbidden'],
    ),
    _MessageEntry(
      key: 'auth_offline_mode',
      ar: 'تم الدخول في وضع عدم الاتصال (بيانات مخزنة محلياً)',
      en: 'Logged in offline mode (cached local session)',
      keywords: ['وضع عدم الاتصال', 'offline mode', 'cached local session'],
    ),

    // -------------------------------------------------------------
    // 2. شبكة الاتصال والسيرفر (Network & HTTP)
    // -------------------------------------------------------------
    _MessageEntry(
      key: 'net_no_connection',
      ar: 'تعذر الاتصال بالسيرفر، يرجى التحقق من اتصال الإنترنت',
      en: 'Unable to connect to server, please check your network connection',
      keywords: [
        'تعذر الاتصال بالسيرفر',
        'اتصال الإنترنت',
        'socketexception',
        'failed host lookup',
        'connection refused',
        'network is unreachable',
        'no internet',
      ],
    ),
    _MessageEntry(
      key: 'net_timeout',
      ar: 'انتهت مهلة الاتصال بالسيرفر، يرجى إعادة المحاولة',
      en: 'Connection timed out, please try again',
      keywords: ['time out', 'timed out', 'timeout', 'مهلة الاتصال', 'connecttimeout', 'receivetimeout'],
    ),
    _MessageEntry(
      key: 'net_server_error',
      ar: 'حدث خطأ داخلي في السيرفر، يرجى المحاولة لاحقاً',
      en: 'Internal server error occurred, please try again later',
      keywords: ['internal server error', 'status code 500', 'خطأ داخلي في السيرفر', 'server error'],
    ),
    _MessageEntry(
      key: 'net_not_found',
      ar: 'المورد أو الرابط المطلوب غير موجود',
      en: 'Requested resource was not found (404)',
      keywords: ['not found', 'status code 404', 'غير موجود'],
    ),
    _MessageEntry(
      key: 'net_action_not_found',
      ar: 'الأمر المطلوب غير معرف بالسيرفر',
      en: 'Requested action not found on server',
      keywords: ['action not found', 'الأمر المطلوب غير'],
    ),

    // -------------------------------------------------------------
    // 3. تذاكر الدعم الفني والمتابعات (Support Tickets)
    // -------------------------------------------------------------
    _MessageEntry(
      key: 'ticket_add_success',
      ar: 'تم تسجيل التذكرة بنجاح',
      en: 'Ticket registered successfully',
      keywords: ['تم تسجيل التذكرة بنجاح', 'ticket registered successfully', 'ticket added'],
    ),
    _MessageEntry(
      key: 'ticket_update_success',
      ar: 'تم تحديث التذكرة بنجاح',
      en: 'Ticket updated successfully',
      keywords: ['تم تحديث التذكرة بنجاح', 'ticket updated successfully', 'ticket updated'],
    ),
    _MessageEntry(
      key: 'ticket_delete_success',
      ar: 'تم حذف التذكرة بنجاح',
      en: 'Ticket deleted successfully',
      keywords: ['تم حذف التذكرة بنجاح', 'ticket deleted successfully'],
    ),
    _MessageEntry(
      key: 'ticket_sheet_missing',
      ar: 'جدول التذاكر غير موجود في السيرفر',
      en: 'Support tickets sheet not found on server',
      keywords: ['جدول التذاكر غير موجود', 'supporttickets not found'],
    ),
    _MessageEntry(
      key: 'ticket_invalid_row',
      ar: 'رقم الصف أو التذكرة غير صالح',
      en: 'Invalid ticket row number',
      keywords: ['رقم الصف غير صالح', 'invalid row'],
    ),
    _MessageEntry(
      key: 'problem_add_success',
      ar: 'تمت إضافة المشكلة بنجاح',
      en: 'Problem type added successfully',
      keywords: ['تمت إضافة المشكلة بنجاح', 'problem added successfully'],
    ),
    _MessageEntry(
      key: 'problem_exists',
      ar: 'المشكلة موجودة مسبقاً',
      en: 'Problem type already exists',
      keywords: ['المشكلة موجودة مسبقاً', 'problem already exists'],
    ),
    _MessageEntry(
      key: 'problem_name_empty',
      ar: 'يرجى إدخال اسم المشكلة الجديدة',
      en: 'Please enter new problem type name',
      keywords: ['يرجى إدخال اسم المشكلة الجديدة', 'problem name required'],
    ),

    // -------------------------------------------------------------
    // 4. الدوام الذكي والموقع الجغرافي (Attendance & Geofence)
    // -------------------------------------------------------------
    _MessageEntry(
      key: 'att_checkin_success',
      ar: 'تم تسجيل الحضور بنجاح داخل مقر الشركة',
      en: 'Check-in recorded successfully within company premises',
      keywords: ['تسجيل الحضور بنجاح', 'check-in recorded successfully', 'checkin success'],
    ),
    _MessageEntry(
      key: 'att_checkout_success',
      ar: 'تم تسجيل الانصراف بنجاح',
      en: 'Check-out recorded successfully',
      keywords: ['تسجيل الانصراف بنجاح', 'check-out recorded successfully', 'checkout success'],
    ),
    _MessageEntry(
      key: 'att_outside_geofence',
      ar: 'أنت خارج النطاق الجغرافي المسموح لمقر الشركة، لا يمكن تسجيل الدوام',
      en: 'You are outside the company geofence radius, check-in blocked',
      keywords: ['خارج النطاق الجغرافي', 'outside geofence', 'geofence radius'],
    ),
    _MessageEntry(
      key: 'att_mock_gps',
      ar: 'تم اكتشاف تزييف بالموقع الجغرافي (Mock GPS)، تم حظر التسجيل',
      en: 'Fake GPS detected (Mock GPS), check-in blocked',
      keywords: ['تزييف بالموقع الجغرافي', 'mock gps', 'fake location'],
    ),
    _MessageEntry(
      key: 'att_location_denied',
      ar: 'يرجى منح إذن الوصول إلى الموقع الجغرافي لتسجيل الدوام',
      en: 'Location permission required for attendance check-in',
      keywords: ['إذن الوصول إلى الموقع', 'location permission denied'],
    ),
    _MessageEntry(
      key: 'att_sheet_missing',
      ar: 'ورقة الدوام غير موجودة في السيرفر',
      en: 'Attendance sheet not found on server',
      keywords: ['ورقة الدوام غير موجودة', 'attendancerecords not found'],
    ),
    _MessageEntry(
      key: 'payroll_locked',
      ar: 'تم إقفال الشهر المالي للرواتب، لا يمكن تعديل السجلات',
      en: 'Payroll period is locked, modifications are disabled',
      keywords: ['الراتب مقفل', 'إقفال الشهر المالي', 'payroll is locked', 'payroll_locked'],
    ),

    // -------------------------------------------------------------
    // 5. طلبات الاعتماد والاستثناءات (Approvals & Overrides)
    // -------------------------------------------------------------
    _MessageEntry(
      key: 'approval_submitted',
      ar: 'تم إرسال طلب الاعتماد بنجاح',
      en: 'Approval request submitted successfully',
      keywords: ['إرسال طلب الاعتماد بنجاح', 'approval request submitted'],
    ),
    _MessageEntry(
      key: 'approval_approved',
      ar: 'تم اعتماد الطلب بنجاح',
      en: 'Request approved successfully',
      keywords: ['اعتماد الطلب بنجاح', 'request approved'],
    ),
    _MessageEntry(
      key: 'approval_rejected',
      ar: 'تم رفض طلب الاعتماد',
      en: 'Approval request has been rejected',
      keywords: ['تم رفض الطلب', 'request rejected'],
    ),

    // -------------------------------------------------------------
    // 6. عمليات عامة (General Operations)
    // -------------------------------------------------------------
    _MessageEntry(
      key: 'gen_saved',
      ar: 'تم حفظ التعديلات بنجاح',
      en: 'Changes saved successfully',
      keywords: ['تم الحفظ بنجاح', 'تم حفظ', 'saved successfully'],
    ),
    _MessageEntry(
      key: 'gen_sync_success',
      ar: 'تمت المزامنة مع السيرفر بنجاح',
      en: 'Synced with server successfully',
      keywords: ['تمت المزامنة بنجاح', 'synced successfully'],
    ),
    _MessageEntry(
      key: 'gen_whatsapp_error',
      ar: 'تعذر فتح تطبيق واتساب، يرجى المحاولة لاحقاً',
      en: 'Could not launch WhatsApp, please try again later',
      keywords: ['تعذر فتح تطبيق واتساب', 'whatsapp_launch_error'],
    ),
    _MessageEntry(
      key: 'gen_unknown_error',
      ar: 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً',
      en: 'An unexpected error occurred, please try again',
      keywords: ['خطأ غير متوقع', 'unexpected error'],
    ),
  ];

  /// ترجمة أي رسالة أو كائن خطأ بناءً على لغة التطبيق الحالية
  static String translate(BuildContext context, dynamic input) {
    if (input == null) return '';

    final isArabic = AppLocalizations.of(context).isArabic;

    // 1. معالجة DioException تلقائياً
    if (input is DioException) {
      return _translateDioException(input, isArabic);
    }

    String raw = input.toString().trim();
    if (raw.isEmpty) return '';

    // تنظيف البوادئ الشائعة للأخطاء
    if (raw.startsWith('Exception: ')) {
      raw = raw.replaceFirst('Exception: ', '').trim();
    }
    if (raw.startsWith('Error: ')) {
      raw = raw.replaceFirst('Error: ', '').trim();
    }

    // 2. التحقق إن كانت العبارة مفتاحاً مسجلاً في قاموس الترجمة الأساسي AppLocalizations
    final directTr = AppLocalizations.of(context).translate(raw);
    if (directTr != raw) {
      return directTr;
    }

    // 3. البحث في القاموس الذكي للأخطاء ورسائل الباك إند
    final lowerRaw = raw.toLowerCase();
    for (final entry in _dictionary) {
      // تطابق مباشر بالمفتاح
      if (entry.key == raw || entry.key == lowerRaw) {
        return isArabic ? entry.ar : entry.en;
      }

      // تطابق مباشر بالنص العربي أو الإنجليزي
      if (entry.ar == raw) {
        return isArabic ? entry.ar : entry.en;
      }
      if (entry.en.toLowerCase() == lowerRaw) {
        return isArabic ? entry.ar : entry.en;
      }

      // تطابق بالكلمات المفتاحية
      for (final kw in entry.keywords) {
        if (lowerRaw.contains(kw.toLowerCase())) {
          return isArabic ? entry.ar : entry.en;
        }
      }
    }

    // 4. إذا لم يتم إيجاد تطابق مباشر، محاولة الكشف الذكي عن الكلمات
    if (!isArabic) {
      // تحويل الكلمات العربية الشائعة إلى إنجليزية إن كانت اللغة إنجليزية
      if (lowerRaw.contains('كلمة المرور') || lowerRaw.contains('المرور')) {
        return 'Incorrect password or authentication error';
      }
      if (lowerRaw.contains('المستخدم')) {
        return 'Invalid or non-existent username';
      }
      if (lowerRaw.contains('إنترنت') || lowerRaw.contains('اتصال')) {
        return 'Network connection error, please check your internet';
      }
      if (lowerRaw.contains('تذكرة') || lowerRaw.contains('التذاكر')) {
        return 'Support tickets operation error';
      }
      if (lowerRaw.contains('دوام') || lowerRaw.contains('حضور')) {
        return 'Attendance operation error';
      }
      if (lowerRaw.contains('صلاحية') || lowerRaw.contains('صلاحيات')) {
        return 'Permission denied for this action';
      }
    }

    return raw;
  }

  /// ترجمة أخطاء Dio
  static String _translateDioException(DioException error, bool isArabic) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return isArabic
            ? 'انتهت مهلة الاتصال بالسيرفر، يرجى إعادة المحاولة'
            : 'Connection timed out, please try again';
      case DioExceptionType.connectionError:
        return isArabic
            ? 'تعذر الاتصال بالسيرفر، يرجى التحقق من اتصال الإنترنت'
            : 'Unable to connect to server, please check your network connection';
      case DioExceptionType.badResponse:
        final code = error.response?.statusCode;
        if (code == 401) {
          return isArabic
              ? 'غير مصرح، يرجى تسجيل الدخول مجدداً'
              : 'Unauthorized access, please sign in again';
        } else if (code == 403) {
          return isArabic
              ? 'تم رفض الوصول، ليس لديك الصلاحية المطلوبة'
              : 'Access forbidden, you lack required permissions';
        } else if (code == 404) {
          return isArabic
              ? 'المورد المطلوب غير موجود بالسيرفر'
              : 'Requested resource was not found on server';
        } else if (code != null && code >= 500) {
          return isArabic
              ? 'حدث خطأ في سيرفر مزود الخدمة، يرجى المحاولة لاحقاً'
              : 'ISP server encountered an internal error, please try later';
        }
        return isArabic
            ? 'استجابة غير صحيحة من السيرفر (كود $code)'
            : 'Invalid server response (Status $code)';
      case DioExceptionType.cancel:
        return isArabic ? 'تم إلغاء العملية' : 'Request was cancelled';
      default:
        return isArabic
            ? 'تعذر الاتصال بالسيرفر، يرجى التحقق من اتصال الإنترنت'
            : 'Unable to connect to server, please check your network connection';
    }
  }
}

class _MessageEntry {
  final String key;
  final String ar;
  final String en;
  final List<String> keywords;

  const _MessageEntry({
    required this.key,
    required this.ar,
    required this.en,
    required this.keywords,
  });
}
