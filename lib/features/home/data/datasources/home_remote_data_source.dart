import 'dart:convert';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/models/dashboard_stats_model.dart';

abstract class HomeRemoteDataSource {
  Future<DashboardStatsModel> fetchDashboardStats();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient _dioClient;

  HomeRemoteDataSourceImpl({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  @override
  Future<DashboardStatsModel> fetchDashboardStats() async {
    final response = await _dioClient.get(
      ApiEndpoints.defaultBaseUrl,
      queryParameters: {
        'action': ApiEndpoints.actionInit,
      },
    );

    dynamic data = response.data;
    if (data is String) {
      try {
        data = jsonDecode(data);
      } catch (_) {}
    }

    if (data is Map && data['success'] == true) {
      final recentRaw = (data['recent_tickets'] as List<dynamic>?) ?? [];
      final employeesRaw = (data['employees'] as List<dynamic>?) ?? [];
      final usersRaw = (data['users'] as List<dynamic>?) ?? [];

      int inProgress = 0;
      int resolved = 0;
      final recentItems = <RecentTicketItem>[];

      for (final item in recentRaw) {
        if (item is Map) {
          final ticket = RecentTicketItem(
            rowId: int.tryParse(item['row_id']?.toString() ?? '0') ?? 0,
            subscriberName: item['subscriber_name']?.toString() ?? '',
            landline: item['landline']?.toString() ?? '',
            problem: item['problem']?.toString() ?? '',
            status: item['status']?.toString() ?? 'قيد الحل',
            date: item['date']?.toString() ?? '',
            employee: item['employee']?.toString() ?? '',
          );
          recentItems.add(ticket);

          final st = ticket.status.trim();
          if (st == 'تم الحل' || st.toLowerCase() == 'resolved') {
            resolved++;
          } else {
            inProgress++;
          }
        }
      }

      final activeCount = employeesRaw.isNotEmpty
          ? employeesRaw.length
          : (usersRaw.isNotEmpty ? usersRaw.length : 7);

      return DashboardStatsModel(
        totalTickets: recentRaw.length,
        inProgressTickets: inProgress,
        resolvedToday: resolved,
        isCheckedInToday: false, // يتم تحديثها من سجل الدوام
        activeEmployeesCount: activeCount,
        isServerConnected: true,
        lastSyncTime: DateTime.now(),
        recentTickets: recentItems,
      );
    } else {
      throw Exception('فشل جلب إحصائيات لوحة التحكم من الخادم');
    }
  }
}
