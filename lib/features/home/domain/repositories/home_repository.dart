import '../../../auth/domain/models/user_model.dart';
import '../models/dashboard_stats_model.dart';

abstract class HomeRepository {
  Future<DashboardStatsModel> getDashboardStats({bool forceRefresh = false});
  Future<DashboardStatsModel?> getCachedStats();
  Future<UserModel?> getCurrentUser();
  Future<void> logout();
}
