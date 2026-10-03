/// كائن بيانات إحصائيات لوحة التحكم الرئيسية (Dashboard Stats)
class DashboardStatsModel {
  final int totalTickets;
  final int inProgressTickets;
  final int resolvedToday;
  final bool isCheckedInToday;
  final String? checkInTime;
  final int activeEmployeesCount;
  final bool isServerConnected;
  final DateTime lastSyncTime;
  final List<RecentTicketItem> recentTickets;

  const DashboardStatsModel({
    this.totalTickets = 0,
    this.inProgressTickets = 0,
    this.resolvedToday = 0,
    this.isCheckedInToday = false,
    this.checkInTime,
    this.activeEmployeesCount = 0,
    this.isServerConnected = true,
    required this.lastSyncTime,
    this.recentTickets = const [],
  });

  factory DashboardStatsModel.fromJson(Map<String, dynamic> json) {
    return DashboardStatsModel(
      totalTickets: int.tryParse(json['total_tickets']?.toString() ?? '0') ?? 0,
      inProgressTickets: int.tryParse(json['in_progress_tickets']?.toString() ?? '0') ?? 0,
      resolvedToday: int.tryParse(json['resolved_today']?.toString() ?? '0') ?? 0,
      isCheckedInToday: json['is_checked_in_today'] == true,
      checkInTime: json['check_in_time']?.toString(),
      activeEmployeesCount: int.tryParse(json['active_employees_count']?.toString() ?? '0') ?? 0,
      isServerConnected: json['is_server_connected'] != false,
      lastSyncTime: DateTime.tryParse(json['last_sync_time']?.toString() ?? '') ?? DateTime.now(),
      recentTickets: (json['recent_tickets'] as List<dynamic>?)
              ?.map((item) => RecentTicketItem.fromJson(Map<String, dynamic>.from(item as Map)))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_tickets': totalTickets,
      'in_progress_tickets': inProgressTickets,
      'resolved_today': resolvedToday,
      'is_checked_in_today': isCheckedInToday,
      'check_in_time': checkInTime,
      'active_employees_count': activeEmployeesCount,
      'is_server_connected': isServerConnected,
      'last_sync_time': lastSyncTime.toIso8601String(),
      'recent_tickets': recentTickets.map((t) => t.toJson()).toList(),
    };
  }

  DashboardStatsModel copyWith({
    int? totalTickets,
    int? inProgressTickets,
    int? resolvedToday,
    bool? isCheckedInToday,
    String? checkInTime,
    int? activeEmployeesCount,
    bool? isServerConnected,
    DateTime? lastSyncTime,
    List<RecentTicketItem>? recentTickets,
  }) {
    return DashboardStatsModel(
      totalTickets: totalTickets ?? this.totalTickets,
      inProgressTickets: inProgressTickets ?? this.inProgressTickets,
      resolvedToday: resolvedToday ?? this.resolvedToday,
      isCheckedInToday: isCheckedInToday ?? this.isCheckedInToday,
      checkInTime: checkInTime ?? this.checkInTime,
      activeEmployeesCount: activeEmployeesCount ?? this.activeEmployeesCount,
      isServerConnected: isServerConnected ?? this.isServerConnected,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      recentTickets: recentTickets ?? this.recentTickets,
    );
  }
}

class RecentTicketItem {
  final int rowId;
  final String subscriberName;
  final String landline;
  final String problem;
  final String status;
  final String date;
  final String time;
  final String employee;

  const RecentTicketItem({
    required this.rowId,
    required this.subscriberName,
    required this.landline,
    required this.problem,
    required this.status,
    required this.date,
    this.time = '',
    required this.employee,
  });

  /// تاريخ نظيف بدون أصفار الوقت إذا كانت موجودة (مثال: 2026/09/27)
  String get cleanDate {
    if (date.isEmpty) return '';
    final parts = date.split(' ');
    return parts.first.replaceAll('-', '/');
  }

  /// وقت نظيف بالساعات والدقائق (مثال: 16:39)
  String get cleanTime {
    if (time.isEmpty) return '';
    // إذا كان التنسيق 1899/12/30 16:39:19 نأخذ الجزء الثاني
    final parts = time.split(' ');
    final timeStr = parts.length > 1 ? parts.last : parts.first;
    final timeParts = timeStr.split(':');
    if (timeParts.length >= 2) {
      return '${timeParts[0]}:${timeParts[1]}';
    }
    return timeStr;
  }

  factory RecentTicketItem.fromJson(Map<String, dynamic> json) {
    return RecentTicketItem(
      rowId: int.tryParse(json['row_id']?.toString() ?? '0') ?? 0,
      subscriberName: json['subscriber_name']?.toString() ?? '',
      landline: json['landline']?.toString() ?? '',
      problem: json['problem']?.toString() ?? '',
      status: json['status']?.toString() ?? 'قيد الحل',
      date: json['date']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      employee: json['employee']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'row_id': rowId,
      'subscriber_name': subscriberName,
      'landline': landline,
      'problem': problem,
      'status': status,
      'date': date,
      'time': time,
      'employee': employee,
    };
  }
}
