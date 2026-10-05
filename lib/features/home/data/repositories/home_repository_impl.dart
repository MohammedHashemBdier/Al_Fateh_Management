import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/domain/models/user_model.dart';
import '../../../auth/domain/repositories/auth_repository.dart';
import '../../domain/models/dashboard_stats_model.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;
  final AuthRepository _authRepository;

  HomeRepositoryImpl({
    HomeRemoteDataSource? remoteDataSource,
    HomeLocalDataSource? localDataSource,
    AuthRepository? authRepository,
  }) : _remoteDataSource = remoteDataSource ?? HomeRemoteDataSourceImpl(),
       _localDataSource = localDataSource ?? HomeLocalDataSourceImpl(),
       _authRepository = authRepository ?? AuthRepositoryImpl();

  @override
  Future<UserModel?> getCurrentUser() async {
    final session = await _authRepository.getSavedSession();
    return session?.user;
  }

  @override
  Future<DashboardStatsModel?> getCachedStats() async {
    try {
      return await _localDataSource.getDashboardStats();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<DashboardStatsModel> getDashboardStats({
    bool forceRefresh = false,
  }) async {
    try {
      // 1. محاولة الجلب الحي من الخادم السحابي
      final remoteStats = await _remoteDataSource.fetchDashboardStats();
      // حفظ في الكاش المشفر محلياً
      await _localDataSource.saveDashboardStats(remoteStats);
      return remoteStats;
    } catch (_) {
      // 2. العمل بدون إنترنت: استرجاع البيانات المخزنة مؤقتاً في الكاش المحلي
      final cached = await _localDataSource.getDashboardStats();
      if (cached != null) {
        return cached.copyWith(isServerConnected: false);
      }

      // إذا لم يسبق حفظ بيانات مسبقة
      return DashboardStatsModel(
        totalTickets: 0,
        inProgressTickets: 0,
        resolvedToday: 0,
        isCheckedInToday: false,
        activeEmployeesCount: 0,
        isServerConnected: false,
        lastSyncTime: DateTime.now(),
        recentTickets: [],
      );
    }
  }

  @override
  Future<void> logout() async {
    await _authRepository.logout();
    await _localDataSource.clearDashboardStats();
  }
}
