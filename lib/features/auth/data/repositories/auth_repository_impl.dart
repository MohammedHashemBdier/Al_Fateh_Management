import '../../../../core/utils/app_crypto.dart';
import '../../domain/models/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl({
    AuthRemoteDataSource? remoteDataSource,
    AuthLocalDataSource? localDataSource,
  }) : _remoteDataSource = remoteDataSource ?? AuthRemoteDataSourceImpl(),
       _localDataSource = localDataSource ?? AuthLocalDataSourceImpl();

  @override
  Future<AuthSession> login({
    required String username,
    required String password,
    bool rememberMe = true,
  }) async {
    final cleanUsername = username.trim().toLowerCase();

    try {
      // 1. المحاولة عبر الشبكة بالاتصال بسيرفر Google Apps Script
      final session = await _remoteDataSource.login(
        username: cleanUsername,
        password: password,
      );

      // حفظ الجلسة في الكاش المحلي مشفرة
      await _localDataSource.saveSession(session);
      await _localDataSource.saveRememberMe(rememberMe);

      // حفظ الهاش الأمني للتحقق عند انقطاع الإنترنت (Offline Salted Verifier)
      await _localDataSource.saveOfflineVerifier(
        cleanUsername,
        AppCrypto.hashOfflinePassword(password),
      );

      // حفظ أو حذف اسم المستخدم حسب تفعيل "تذكرني"
      if (rememberMe) {
        await _localDataSource.saveRememberedUsername(cleanUsername);
      } else {
        await _localDataSource.saveRememberedUsername(null);
      }

      return session;
    } catch (e) {
      // إذا كان الخطأ صريحاً من السيرفر (بيانات خاطئة أو حساب معطل)، لا نسمح بالدخول الأوفلاين
      final errStr = e.toString();
      if (errStr.contains('login_error_invalid_password') ||
          errStr.contains('login_error_user_not_found') ||
          errStr.contains('login_error_account_disabled')) {
        rethrow;
      }

      // 2. معالجة العمل بدون إنترنت (Offline Fallback عند انقطاع الشبكة)
      final cachedSession = await _localDataSource.getSession();
      if (cachedSession != null &&
          cachedSession.user.username.toLowerCase() == cleanUsername) {
        // التحقق من صلاحية الجلسة المحفوظة (أقصى حد 14 يوماً للعمل بدون اتصال)
        final age = DateTime.now().difference(cachedSession.loginTime).inDays;
        if (age > 14) {
          throw Exception('auth_session_expired');
        }

        // التحقق الأمني من صحة كلمة المرور المدخلة عبر الـ Offline Verifier
        final verifier = await _localDataSource.getOfflineVerifier(
          cleanUsername,
        );
        if (verifier != null &&
            verifier != AppCrypto.hashOfflinePassword(password)) {
          throw Exception('login_error_invalid_password');
        }

        // السماح بالدخول في وضع عدم الاتصال بالبيانات المخزنة مؤقتاً
        return cachedSession.copyWith(isOffline: true);
      }

      // إذا تعذر الاتصال ولا توجد جلسة سابقة متطابقة
      rethrow;
    }
  }

  @override
  Future<AuthSession?> getSavedSession() async {
    final isRemembered = await _localDataSource.isRememberMe();
    if (!isRemembered) return null;

    final session = await _localDataSource.getSession();
    if (session == null) return null;

    // فحص انتهاء صلاحية الجلسة المحفوظة (أقصى حد 14 يوماً)
    final age = DateTime.now().difference(session.loginTime).inDays;
    if (age > 14) {
      await _localDataSource.clearSession();
      return null;
    }

    return session;
  }

  @override
  Future<void> logout() async {
    await _localDataSource.clearSession();
  }

  @override
  Future<String?> getRememberedUsername() async {
    return _localDataSource.getRememberedUsername();
  }

  @override
  Future<void> saveRememberedUsername(String? username) async {
    return _localDataSource.saveRememberedUsername(username);
  }
}
