import '../models/auth_session.dart';

abstract class AuthRepository {
  /// تسجيل الدخول بالاتصال بالخادم مع التحقق من الكاش المحلي في حال انقطاع النت
  Future<AuthSession> login({
    required String username,
    required String password,
    bool rememberMe = true,
  });

  /// استرجاع الجلسة المحفوظة محلياً (Offline Caching)
  Future<AuthSession?> getSavedSession({bool requireRememberMe = false});

  /// تسجيل الخروج وحذف الجلسة المخزنة
  Future<void> logout();

  /// فحص هل يوجد اسم مستخدم محفوظ (Remember Me)
  Future<String?> getRememberedUsername();

  /// حفظ اسم المستخدم لتسهيل الدخول القادم
  Future<void> saveRememberedUsername(String? username);
}
