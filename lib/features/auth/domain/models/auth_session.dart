import 'user_model.dart';

/// كائن جلسة تسجيل الدخول المشفر والمحفوظ محلياً للعمل بدون إنترنت
class AuthSession {
  final UserModel user;
  final String sessionToken;
  final DateTime loginTime;
  final int permissionsVersion;
  final bool isOffline;

  const AuthSession({
    required this.user,
    required this.sessionToken,
    required this.loginTime,
    this.permissionsVersion = 1,
    this.isOffline = false,
  });

  factory AuthSession.fromJson(Map<String, dynamic> json) {
    return AuthSession(
      user: UserModel.fromJson(Map<String, dynamic>.from(json['user'] ?? {})),
      sessionToken: json['session_token']?.toString() ?? '',
      loginTime:
          DateTime.tryParse(json['login_time']?.toString() ?? '') ??
          DateTime.now(),
      permissionsVersion:
          int.tryParse(json['permissions_version']?.toString() ?? '1') ?? 1,
      isOffline: json['is_offline'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'session_token': sessionToken,
      'login_time': loginTime.toIso8601String(),
      'permissions_version': permissionsVersion,
      'is_offline': isOffline,
    };
  }

  AuthSession copyWith({
    UserModel? user,
    String? sessionToken,
    DateTime? loginTime,
    int? permissionsVersion,
    bool? isOffline,
  }) {
    return AuthSession(
      user: user ?? this.user,
      sessionToken: sessionToken ?? this.sessionToken,
      loginTime: loginTime ?? this.loginTime,
      permissionsVersion: permissionsVersion ?? this.permissionsVersion,
      isOffline: isOffline ?? this.isOffline,
    );
  }
}
