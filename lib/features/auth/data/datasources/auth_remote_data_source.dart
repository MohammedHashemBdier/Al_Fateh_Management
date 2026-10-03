import 'dart:convert';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/app_crypto.dart';
import '../../domain/models/auth_session.dart';
import '../../domain/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthSession> login({
    required String username,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  @override
  Future<AuthSession> login({
    required String username,
    required String password,
  }) async {
    final passwordHash = AppCrypto.hashPassword(password);

    final response = await _dioClient.get(
      ApiEndpoints.defaultBaseUrl,
      queryParameters: {
        'action': ApiEndpoints.actionLogin,
        'username': username.trim().toLowerCase(),
        'password_hash': passwordHash,
      },
    );

    dynamic data = response.data;
    if (data is String) {
      try {
        data = jsonDecode(data);
      } catch (_) {}
    }

    if (data is Map && data['success'] == true) {
      final userMap = Map<String, dynamic>.from(data['user'] ?? {});
      final user = UserModel.fromJson(userMap);
      final permsVersion = int.tryParse(data['permissions_version']?.toString() ?? '1') ?? 1;

      return AuthSession(
        user: user,
        sessionToken: 'TOKEN_${user.userId}_${DateTime.now().millisecondsSinceEpoch}',
        loginTime: DateTime.now(),
        permissionsVersion: permsVersion,
        isOffline: false,
      );
    } else {
      final serverMsg = data is Map && data['message'] != null
          ? data['message'].toString().trim()
          : '';

      String errorCode = 'login_error_generic';
      if (serverMsg.contains('كلمة المرور غير صحيحة')) {
        errorCode = 'login_error_invalid_password';
      } else if (serverMsg.contains('اسم المستخدم غير موجود')) {
        errorCode = 'login_error_user_not_found';
      } else if (serverMsg.contains('تم تعطيل هذا الحساب')) {
        errorCode = 'login_error_account_disabled';
      } else if (serverMsg.isNotEmpty) {
        errorCode = serverMsg;
      }
      throw Exception(errorCode);
    }
  }
}
