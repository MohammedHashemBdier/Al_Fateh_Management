import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/app_crypto.dart';
import '../../domain/models/dashboard_stats_model.dart';

abstract class HomeLocalDataSource {
  Future<void> saveDashboardStats(DashboardStatsModel stats);
  Future<DashboardStatsModel?> getDashboardStats();
  Future<void> clearDashboardStats();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  static const String _keyDashboardStats = 'alfateh_dashboard_stats_enc';

  @override
  Future<void> saveDashboardStats(DashboardStatsModel stats) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode(stats.toJson());
    final encrypted = AppCrypto.encryptData(jsonStr);
    await prefs.setString(_keyDashboardStats, encrypted);
  }

  @override
  Future<DashboardStatsModel?> getDashboardStats() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encrypted = prefs.getString(_keyDashboardStats);
      if (encrypted == null || encrypted.isEmpty) return null;

      final jsonStr = AppCrypto.decryptData(encrypted);
      final map = jsonDecode(jsonStr);
      if (map is Map<String, dynamic>) {
        return DashboardStatsModel.fromJson(map);
      }
    } catch (_) {}
    return null;
  }

  @override
  Future<void> clearDashboardStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyDashboardStats);
  }
}
