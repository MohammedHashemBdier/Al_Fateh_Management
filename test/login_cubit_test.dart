import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:al_fateh_management/features/auth/domain/models/auth_session.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:al_fateh_management/features/auth/domain/repositories/auth_repository.dart';
import 'package:al_fateh_management/features/auth/presentation/cubit/login_cubit.dart';
import 'package:al_fateh_management/features/auth/presentation/cubit/login_state.dart';

class MockAuthRepository implements AuthRepository {
  bool shouldSucceed = true;
  String? rememberedUser;

  @override
  Future<AuthSession> login({
    required String username,
    required String password,
    bool rememberMe = true,
  }) async {
    if (!shouldSucceed) {
      throw Exception('اسم المستخدم أو كلمة المرور غير صحيحة');
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
      sessionToken: 'TOKEN_MOCK_123',
      loginTime: DateTime.now(),
      permissionsVersion: 1,
      isOffline: false,
    );
  }

  @override
  Future<AuthSession?> getSavedSession() async => null;

  @override
  Future<void> logout() async {}

  @override
  Future<String?> getRememberedUsername() async => rememberedUser;

  @override
  Future<void> saveRememberedUsername(String? username) async {
    rememberedUser = username;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('UserModel Tests', () {
    test('Correctly identifies roles and active status', () {
      final admin = UserModel(
        userId: 'USR-001',
        username: 'admin',
        fullName: 'مدير النظام',
        department: 'MANAGEMENT',
        roleId: 'ROLE_ADMIN',
        status: 'ACTIVE',
      );

      expect(admin.isAdmin, isTrue);
      expect(admin.isSupport, isFalse);
      expect(admin.isActive, isTrue);
      expect(admin.canAccessManagement, isTrue);

      final support = UserModel(
        userId: 'USR-002',
        username: 'hashem',
        fullName: 'محمد هاشم بدير',
        department: 'SUPPORT',
        roleId: 'ROLE_SUPPORT',
        status: 'ACTIVE',
      );

      expect(support.isAdmin, isFalse);
      expect(support.isSupport, isTrue);
      expect(support.canAccessManagement, isFalse);
    });
  });

  group('LoginCubit Tests', () {
    test('Initial state is LoginInitial', () {
      final mockRepo = MockAuthRepository();
      final cubit = LoginCubit(repository: mockRepo);
      expect(cubit.state, isA<LoginInitial>());
    });

    test('Empty credentials emit LoginFailure', () async {
      final mockRepo = MockAuthRepository();
      final cubit = LoginCubit(repository: mockRepo);
      await cubit.loadInitialData();

      await cubit.login(username: '', password: '');
      expect(cubit.state, isA<LoginFailure>());
      expect((cubit.state as LoginFailure).errorMessage, equals('login_error_empty_fields'));
    });

    test('Successful login emits LoginLoading then LoginSuccess', () async {
      final mockRepo = MockAuthRepository();
      final cubit = LoginCubit(repository: mockRepo);

      final states = <LoginState>[];
      final subscription = cubit.stream.listen(states.add);

      await cubit.login(username: 'admin', password: 'password123');

      expect(states.any((s) => s is LoginLoading), isTrue);
      expect(cubit.state, isA<LoginSuccess>());

      final successState = cubit.state as LoginSuccess;
      expect(successState.session.user.username, equals('admin'));
      expect(successState.session.user.isAdmin, isTrue);

      await subscription.cancel();
    });

    test('Failed login emits LoginFailure with descriptive message', () async {
      final mockRepo = MockAuthRepository()..shouldSucceed = false;
      final cubit = LoginCubit(repository: mockRepo);

      await cubit.login(username: 'wrong_user', password: 'wrong_password');

      expect(cubit.state, isA<LoginFailure>());
      expect((cubit.state as LoginFailure).errorMessage, contains('غير صحيحة'));
    });

    test('Can toggle rememberMe and skeletonPreview', () {
      final mockRepo = MockAuthRepository();
      final cubit = LoginCubit(repository: mockRepo);

      cubit.toggleRememberMe(false);
      expect((cubit.state as LoginInitial).rememberMe, isFalse);

      cubit.toggleSkeletonPreview();
      expect((cubit.state as LoginInitial).isSkeletonPreview, isTrue);
    });
  });
}
