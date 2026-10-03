import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/core/utils/app_crypto.dart';
import 'package:al_fateh_management/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:al_fateh_management/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:al_fateh_management/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:al_fateh_management/features/auth/domain/models/auth_session.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';

class FakeRemoteDataSource implements AuthRemoteDataSource {
  bool isOnline = true;
  bool returnInvalidCredentials = false;

  @override
  Future<AuthSession> login({
    required String username,
    required String password,
  }) async {
    if (returnInvalidCredentials) {
      throw Exception('login_error_invalid_password');
    }
    if (!isOnline) {
      throw Exception('Connection timed out / Network error');
    }

    return AuthSession(
      user: UserModel(
        userId: 'USR-001',
        username: username,
        fullName: 'مدير النظام',
        department: 'MANAGEMENT',
        roleId: 'ROLE_ADMIN',
        status: 'ACTIVE',
      ),
      sessionToken: 'TOKEN_123',
      loginTime: DateTime.now(),
      permissionsVersion: 1,
      isOffline: false,
    );
  }
}

class FakeLocalDataSource implements AuthLocalDataSource {
  AuthSession? storedSession;
  String? rememberedUsername;
  final Map<String, String> verifiers = {};

  @override
  Future<void> saveSession(AuthSession session) async {
    storedSession = session;
  }

  @override
  Future<AuthSession?> getSession() async => storedSession;

  @override
  Future<void> clearSession() async {
    storedSession = null;
  }

  @override
  Future<void> saveRememberedUsername(String? username) async {
    rememberedUsername = username;
  }

  @override
  Future<String?> getRememberedUsername() async => rememberedUsername;

  @override
  Future<void> saveOfflineVerifier(String username, String verifier) async {
    verifiers[username.toLowerCase()] = verifier;
  }

  @override
  Future<String?> getOfflineVerifier(String username) async {
    return verifiers[username.toLowerCase()];
  }

  bool _rememberMe = true;

  @override
  Future<void> saveRememberMe(bool enabled) async {
    _rememberMe = enabled;
  }

  @override
  Future<bool> isRememberMe() async => _rememberMe;
}

void main() {
  late FakeRemoteDataSource remote;
  late FakeLocalDataSource local;
  late AuthRepositoryImpl repository;

  setUp(() {
    remote = FakeRemoteDataSource();
    local = FakeLocalDataSource();
    repository = AuthRepositoryImpl(
      remoteDataSource: remote,
      localDataSource: local,
    );
  });

  group('AuthRepository Security & Offline Tests', () {
    test('Successful online login saves session and offline verifier', () async {
      final session = await repository.login(
        username: 'admin',
        password: 'password123',
        rememberMe: true,
      );

      expect(session.isOffline, isFalse);
      expect(local.storedSession, isNotNull);
      expect(local.rememberedUsername, 'admin');
      expect(local.verifiers['admin'], isNotNull);
      expect(
        local.verifiers['admin'],
        AppCrypto.hashOfflinePassword('password123'),
      );
    });

    test('Offline login succeeds when credentials match saved verifier', () async {
      // First login online
      await repository.login(
        username: 'admin',
        password: 'password123',
      );

      // Go offline
      remote.isOnline = false;

      // Attempt offline login with the correct password
      final offlineSession = await repository.login(
        username: 'admin',
        password: 'password123',
      );

      expect(offlineSession.isOffline, isTrue);
      expect(offlineSession.user.username, 'admin');
    });

    test('Offline login fails when incorrect password is provided', () async {
      // First login online
      await repository.login(
        username: 'admin',
        password: 'password123',
      );

      // Go offline
      remote.isOnline = false;

      // Attempt offline login with wrong password
      expect(
        () => repository.login(
          username: 'admin',
          password: 'wrong_password',
        ),
        throwsA(
          predicate(
            (e) => e.toString().contains('login_error_invalid_password'),
          ),
        ),
      );
    });

    test('Offline login fails if session is older than 14 days (TTL expired)', () async {
      // Pre-populate an expired session (15 days old)
      local.storedSession = AuthSession(
        user: UserModel(
          userId: 'USR-001',
          username: 'admin',
          fullName: 'مدير النظام',
          department: 'MANAGEMENT',
          roleId: 'ROLE_ADMIN',
          status: 'ACTIVE',
        ),
        sessionToken: 'TOKEN_OLD',
        loginTime: DateTime.now().subtract(const Duration(days: 15)),
        permissionsVersion: 1,
        isOffline: false,
      );
      local.verifiers['admin'] = AppCrypto.hashOfflinePassword('password123');

      // Go offline
      remote.isOnline = false;

      // Attempt login
      expect(
        () => repository.login(
          username: 'admin',
          password: 'password123',
        ),
        throwsA(
          predicate(
            (e) => e.toString().contains('auth_session_expired'),
          ),
        ),
      );
    });

    test('Server rejection (invalid credentials) does not trigger offline fallback', () async {
      // User is cached locally
      await repository.login(
        username: 'admin',
        password: 'password123',
      );

      // Server is online, but rejects the credentials
      remote.isOnline = true;
      remote.returnInvalidCredentials = true;

      expect(
        () => repository.login(
          username: 'admin',
          password: 'wrong_password',
        ),
        throwsA(
          predicate(
            (e) => e.toString().contains('login_error_invalid_password'),
          ),
        ),
      );
    });
  });
}
