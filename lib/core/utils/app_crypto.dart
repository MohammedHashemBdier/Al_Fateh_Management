import 'dart:convert';

import 'package:crypto/crypto.dart';

/// فئة مساعدة لتشفير وحماية البيانات الحساسة وجلسات المستخدمين
class AppCrypto {
  AppCrypto._();

  static const String _localSalt = 'AlFateh_Local_Offline_Salt_2026';
  static const String _encryptionKey = 'AlFateh_Enterprise_Cipher_Key_963';

  /// توليد تجزئة مشفرة بـ SHA-256 لكلمة المرور لمطابقة قاعدة البيانات في السيرفر
  static String hashPassword(String password) {
    if (password.isEmpty) return '';
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// تجزئة أمنية محلية للتحقق من كلمة المرور في وضع عدم الاتصال (Offline Login Verifier)
  static String hashOfflinePassword(String password) {
    if (password.isEmpty) return '';
    final bytes = utf8.encode('$password$_localSalt');
    return sha256.convert(bytes).toString();
  }

  /// فحص مطابقة كلمة المرور مع الهاش المخزن
  static bool verifyPassword(String inputPassword, String storedHash) {
    final computed = hashPassword(inputPassword);
    return computed.toLowerCase() == storedHash.toLowerCase();
  }

  /// تشفير البيانات المخزنة محلياً في ذاكرة التخزين المؤقت (Local Cache Encryption)
  static String encryptData(String plainText) {
    if (plainText.isEmpty) return '';
    final bytes = utf8.encode(plainText);
    final keyBytes = utf8.encode(_encryptionKey);
    final result = <int>[];
    for (int i = 0; i < bytes.length; i++) {
      result.add(bytes[i] ^ keyBytes[i % keyBytes.length]);
    }
    return base64.encode(result);
  }

  /// فك تشفير البيانات المخزنة محلياً
  static String decryptData(String cipherText) {
    if (cipherText.isEmpty) return '';
    try {
      final bytes = base64.decode(cipherText);
      final keyBytes = utf8.encode(_encryptionKey);
      final result = <int>[];
      for (int i = 0; i < bytes.length; i++) {
        result.add(bytes[i] ^ keyBytes[i % keyBytes.length]);
      }
      return utf8.decode(result);
    } catch (_) {
      // دعم عكسي إن كانت البيانات قديمة كنص غير مشفر
      return cipherText;
    }
  }
}
