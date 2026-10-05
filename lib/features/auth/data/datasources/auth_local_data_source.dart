import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_crypto.dart';
import '../../domain/models/auth_session.dart';
import '../../domain/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveSession(AuthSession session);
  Future<AuthSession?> getSession();
  Future<void> clearSession();
  Future<void> saveRememberedUsername(String? username);
  Future<String?> getRememberedUsername();
  Future<void> saveOfflineVerifier(String username, String verifier);
  Future<String?> getOfflineVerifier(String username);
  Future<void> saveRememberMe(bool enabled);
  Future<bool> isRememberMe();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _keySession = 'alfateh_auth_session_enc';
  static const String _keyRememberedUser = 'alfateh_remembered_username';
  static const String _keyOfflineVerifierPrefix = 'alfateh_verifier_';
  static const String _keyRememberMe = 'alfateh_remember_me';

  static AuthSession? activeSession;
  static UserModel? get currentUser => activeSession?.user;

  @override
  Future<void> saveSession(AuthSession session) async {
    activeSession = session;
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode(session.toJson());
    final encrypted = AppCrypto.encryptData(jsonStr);
    await prefs.setString(_keySession, encrypted);
  }

  @override
  Future<AuthSession?> getSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encrypted = prefs.getString(_keySession);
      if (encrypted == null || encrypted.isEmpty) return null;

      final jsonStr = AppCrypto.decryptData(encrypted);
      final map = jsonDecode(jsonStr);
      if (map is Map<String, dynamic>) {
        final session = AuthSession.fromJson(map);
        activeSession = session;
        return session;
      }
    } catch (_) {}
    return null;
  }

  @override
  Future<void> clearSession() async {
    activeSession = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keySession);
    await prefs.setBool(_keyRememberMe, false);
  }

  @override
  Future<void> saveRememberedUsername(String? username) async {
    final prefs = await SharedPreferences.getInstance();
    if (username == null || username.isEmpty) {
      await prefs.remove(_keyRememberedUser);
    } else {
      await prefs.setString(_keyRememberedUser, username);
    }
  }

  @override
  Future<String?> getRememberedUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRememberedUser);
  }

  @override
  Future<void> saveOfflineVerifier(String username, String verifier) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      '$_keyOfflineVerifierPrefix${username.toLowerCase()}',
      verifier,
    );
  }

  @override
  Future<String?> getOfflineVerifier(String username) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(
      '$_keyOfflineVerifierPrefix${username.toLowerCase()}',
    );
  }

  @override
  Future<void> saveRememberMe(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyRememberMe, enabled);
  }

  @override
  Future<bool> isRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyRememberMe) ?? true;
  }
}
