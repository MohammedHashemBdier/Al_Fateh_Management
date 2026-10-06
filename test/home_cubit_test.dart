import 'package:flutter_test/flutter_test.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:al_fateh_management/features/home/domain/models/dashboard_stats_model.dart';
import 'package:al_fateh_management/features/home/domain/repositories/home_repository.dart';
import 'package:al_fateh_management/features/home/presentation/cubit/home_cubit.dart';
import 'package:al_fateh_management/features/home/presentation/cubit/home_state.dart';

class MockHomeRepository implements HomeRepository {
  UserModel? mockUser;
  DashboardStatsModel? mockStats;
  DashboardStatsModel? mockCachedStats;
  bool shouldThrow = false;
  bool logoutCalled = false;

  @override
  Future<UserModel?> getCurrentUser() async {
    if (shouldThrow) throw Exception('Failed to get user');
    return mockUser;
  }

  @override
  Future<DashboardStatsModel?> getCachedStats() async {
    return mockCachedStats;
  }

  @override
  Future<DashboardStatsModel> getDashboardStats({
    bool forceRefresh = false,
  }) async {
    if (shouldThrow) throw Exception('Failed to get stats');
    return mockStats ??
        DashboardStatsModel(
          totalTickets: 10,
          inProgressTickets: 3,
          resolvedToday: 7,
          isCheckedInToday: true,
          activeEmployeesCount: 5,
          isServerConnected: true,
          lastSyncTime: DateTime.now(),
        );
  }

  @override
  Future<void> logout() async {
    logoutCalled = true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    mockRepository.mockUser = const UserModel(
      userId: 'USR-001',
      username: 'admin',
      fullName: 'مدير النظام',
      department: 'MANAGEMENT',
      roleId: 'ROLE_ADMIN',
      status: 'ACTIVE',
    );
  });

  group('HomeCubit Tests', () {
    test('Loads home data successfully and emits HomeLoaded', () async {
      final cubit = HomeCubit(repository: mockRepository);

      // Await until async loadHomeData completes
      await Future.delayed(const Duration(milliseconds: 100));

      expect(cubit.state, isA<HomeLoaded>());
      final loaded = cubit.state as HomeLoaded;
      expect(loaded.user.username, 'admin');
      expect(loaded.stats.totalTickets, 10);
      expect(loaded.isOffline, isFalse);
      expect(loaded.selectedNavIndex, 0);
    });

    test('selectTab updates selectedNavIndex correctly', () async {
      final cubit = HomeCubit(repository: mockRepository);
      await Future.delayed(const Duration(milliseconds: 100));

      cubit.selectTab(2);
      expect(cubit.state, isA<HomeLoaded>());
      final loaded = cubit.state as HomeLoaded;
      expect(loaded.selectedNavIndex, 2);
    });

    test('refreshData fetches new stats and updates state', () async {
      final cubit = HomeCubit(repository: mockRepository);
      await Future.delayed(const Duration(milliseconds: 100));

      mockRepository.mockStats = DashboardStatsModel(
        totalTickets: 25,
        inProgressTickets: 8,
        resolvedToday: 17,
        isCheckedInToday: false,
        activeEmployeesCount: 6,
        isServerConnected: true,
        lastSyncTime: DateTime.now(),
      );

      await cubit.refreshData();

      expect(cubit.state, isA<HomeLoaded>());
      final loaded = cubit.state as HomeLoaded;
      expect(loaded.stats.totalTickets, 25);
    });

    test('logout invokes repository logout', () async {
      final cubit = HomeCubit(repository: mockRepository);
      await Future.delayed(const Duration(milliseconds: 100));

      await cubit.logout();
      expect(mockRepository.logoutCalled, isTrue);
    });

    test('Emits HomeError when user is null', () async {
      mockRepository.mockUser = null;
      final cubit = HomeCubit(repository: mockRepository);
      await Future.delayed(const Duration(milliseconds: 100));

      expect(cubit.state, isA<HomeError>());
      final error = cubit.state as HomeError;
      expect(error.errorMessage, 'auth_session_expired');
    });
  });
}
