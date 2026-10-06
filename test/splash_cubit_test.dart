import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/features/auth/domain/models/auth_session.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:al_fateh_management/features/auth/domain/repositories/auth_repository.dart';
import 'package:al_fateh_management/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:al_fateh_management/features/splash/presentation/cubit/splash_state.dart';

class MockAuthRepositoryForSplash implements AuthRepository {
  AuthSession? savedSession;

  @override
  Future<AuthSession?> getSavedSession() async => savedSession;

  @override
  Future<AuthSession> login({
    required String username,
    required String password,
    bool rememberMe = true,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    savedSession = null;
  }

  @override
  Future<String?> getRememberedUsername() async => null;

  @override
  Future<void> saveRememberedUsername(String? username) async {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SplashCubit Auto-Login Tests', () {
    test('Navigates to /login when no session is saved', () async {
      final mockRepo = MockAuthRepositoryForSplash();
      final cubit = SplashCubit(authRepository: mockRepo);

      await cubit.initializeApp();

      expect(cubit.state, isA<SplashCompleted>());
      final completed = cubit.state as SplashCompleted;
      expect(completed.targetRoute, '/login');
      expect(completed.session, isNull);
    });

    test(
      'Navigates to /home when valid session is saved (Remember Me)',
      () async {
        final mockRepo = MockAuthRepositoryForSplash();
        mockRepo.savedSession = AuthSession(
          user: UserModel(
            userId: 'USR-001',
            username: 'admin',
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

        final cubit = SplashCubit(authRepository: mockRepo);

        await cubit.initializeApp();

        expect(cubit.state, isA<SplashCompleted>());
        final completed = cubit.state as SplashCompleted;
        expect(completed.targetRoute, '/home');
        expect(completed.session, isNotNull);
        expect(completed.session?.user.username, 'admin');
      },
    );
  });
}
