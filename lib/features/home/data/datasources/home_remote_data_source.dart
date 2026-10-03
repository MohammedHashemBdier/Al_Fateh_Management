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
      int resolvedTodayCount = 0;
      final recentItems = <RecentTicketItem>[];

      final now = DateTime.now();
      final todayStr1 =
          '${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}';
      final todayStr2 =
          '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

      int maxRowId = 0;

      for (final item in recentRaw) {
        if (item is Map) {
          final rowId = int.tryParse(item['row_id']?.toString() ?? '0') ?? 0;
          if (rowId > maxRowId) maxRowId = rowId;

          final ticket = RecentTicketItem(
            rowId: rowId,
            subscriberName: item['subscriber_name']?.toString() ?? '',
            landline: item['landline']?.toString() ?? '',
            problem: item['problem']?.toString() ?? '',
            status: item['status']?.toString() ?? 'قيد الحل',
            date: item['date']?.toString() ?? '',
            time: item['time']?.toString() ?? '',
            employee: item['employee']?.toString() ?? '',
          );
          recentItems.add(ticket);

          final st = ticket.status.trim();
          final isResolved = st == 'تم الحل' || st.toLowerCase() == 'resolved';
          if (isResolved) {
            // التحقق الدقيق هل تاريخ حل التذكرة يطابق تاريخ اليوم
            final tDate = ticket.date.trim();
            if (tDate.startsWith(todayStr1) || tDate.startsWith(todayStr2)) {
              resolvedTodayCount++;
            }
          } else {
            inProgress++;
          }
        }
      }

      final activeCount = employeesRaw.isNotEmpty
          ? employeesRaw.length
          : (usersRaw.isNotEmpty ? usersRaw.length : 7);

      // استخراج إجمالي التذاكر الحقيقي (من أحدث row_id في الشيت أو من المفتاح الصريح)
      final explicitTotal = int.tryParse(data['total_tickets']?.toString() ?? '');
      final calculatedTotal = explicitTotal ?? (maxRowId > 1 ? (maxRowId - 1) : recentRaw.length);

      final explicitInProgress = int.tryParse(data['in_progress_tickets']?.toString() ?? '');
      final inProgressTotal = explicitInProgress ?? inProgress;

      final explicitResolvedToday = int.tryParse(data['resolved_today']?.toString() ?? '');
      final resolvedTodayTotal = explicitResolvedToday ?? resolvedTodayCount;

      return DashboardStatsModel(
        totalTickets: calculatedTotal,
        inProgressTickets: inProgressTotal,
        resolvedToday: resolvedTodayTotal,
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
