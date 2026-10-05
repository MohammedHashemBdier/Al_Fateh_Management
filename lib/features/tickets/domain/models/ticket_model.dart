import 'dart:convert';

/// حالة التذكرة التشغيلية
enum TicketStatus {
  open('مفتوح', 'Open'),
  inProgress('قيد الحل', 'In Progress'),
  resolved('تم الحل', 'Resolved'),
  closed('مغلق', 'Closed'),
  pending('معلق', 'Pending'),
  cancelled('لم يتم الحل', 'Unresolved');

  final String labelAr;
  final String labelEn;

  const TicketStatus(this.labelAr, this.labelEn);

  static TicketStatus fromString(String? val) {
    if (val == null) return TicketStatus.inProgress;
    final clean = val.trim();
    for (final status in TicketStatus.values) {
      if (status.labelAr == clean ||
          status.labelEn.toLowerCase() == clean.toLowerCase() ||
          status.name.toLowerCase() == clean.toLowerCase()) {
        return status;
      }
    }
    // المطابقة مع مسميات شيت جوجل التاريخية
    if (clean.contains('تم الحل') || clean.toLowerCase() == 'resolved') {
      return TicketStatus.resolved;
    }
    if (clean.contains('لم يتم') || clean.toLowerCase() == 'unresolved') {
      return TicketStatus.cancelled;
    }
    if (clean.contains('قيد') || clean.toLowerCase() == 'in progress') {
      return TicketStatus.inProgress;
    }
    return TicketStatus.inProgress;
  }
}

/// مستوى الأولوية
enum TicketPriority {
  low('منخفض', 'Low'),
  medium('متوسط', 'Medium'),
  high('عالي', 'High'),
  urgent('عاجل', 'Urgent');

  final String labelAr;
  final String labelEn;

  const TicketPriority(this.labelAr, this.labelEn);

  static TicketPriority fromString(String? val) {
    if (val == null) return TicketPriority.medium;
    final clean = val.trim().toLowerCase();
    for (final p in TicketPriority.values) {
      if (p.labelAr == val ||
          p.labelEn.toLowerCase() == clean ||
          p.name.toLowerCase() == clean) {
        return p;
      }
    }
    return TicketPriority.medium;
  }
}

/// حالة مزامنة التذكرة في النظام المحلي
enum SyncState { synced, pendingAdd, pendingUpdate, conflict }

/// سجل التدقيق والتعديلات على التذكرة
class TicketAuditEntry {
  final String actorName;
  final String action;
  final String timestamp;
  final String? oldValue;
  final String? newValue;
  final String notes;

  const TicketAuditEntry({
    required this.actorName,
    required this.action,
    required this.timestamp,
    this.oldValue,
    this.newValue,
    this.notes = '',
  });

  Map<String, dynamic> toJson() => {
    'actor_name': actorName,
    'action': action,
    'timestamp': timestamp,
    'old_value': oldValue,
    'new_value': newValue,
    'notes': notes,
  };

  factory TicketAuditEntry.fromJson(Map<String, dynamic> json) =>
      TicketAuditEntry(
        actorName: json['actor_name']?.toString() ?? '',
        action: json['action']?.toString() ?? '',
        timestamp: json['timestamp']?.toString() ?? '',
        oldValue: json['old_value']?.toString(),
        newValue: json['new_value']?.toString(),
        notes: json['notes']?.toString() ?? '',
      );
}

/// الكيان الكامل لتذكرة الدعم الفني والمتابعات
class TicketModel {
  final int rowId;
  final String date;
  final String time;
  final String subscriberName;
  final String landline;
  final String mobile;
  final String problem;
  final String solution;
  final String status;
  final String description;
  final String employee;
  final String createdBy;
  final TicketPriority priority;
  final bool isComplaint;
  final int? parentTicketId;
  final SyncState syncState;
  final List<TicketAuditEntry> auditTrail;
  final DateTime updatedAt;

  const TicketModel({
    required this.rowId,
    required this.date,
    required this.time,
    required this.subscriberName,
    required this.landline,
    this.mobile = '',
    required this.problem,
    this.solution = '',
    required this.status,
    this.description = '',
    required this.employee,
    this.createdBy = '',
    this.priority = TicketPriority.medium,
    this.isComplaint = false,
    this.parentTicketId,
    this.syncState = SyncState.synced,
    this.auditTrail = const [],
    required this.updatedAt,
  });

  TicketStatus get statusEnum => TicketStatus.fromString(status);

  bool get isResolved =>
      statusEnum == TicketStatus.resolved || statusEnum == TicketStatus.closed;

  TicketModel copyWith({
    int? rowId,
    String? date,
    String? time,
    String? subscriberName,
    String? landline,
    String? mobile,
    String? problem,
    String? solution,
    String? status,
    String? description,
    String? employee,
    String? createdBy,
    TicketPriority? priority,
    bool? isComplaint,
    int? parentTicketId,
    SyncState? syncState,
    List<TicketAuditEntry>? auditTrail,
    DateTime? updatedAt,
  }) {
    return TicketModel(
      rowId: rowId ?? this.rowId,
      date: date ?? this.date,
      time: time ?? this.time,
      subscriberName: subscriberName ?? this.subscriberName,
      landline: landline ?? this.landline,
      mobile: mobile ?? this.mobile,
      problem: problem ?? this.problem,
      solution: solution ?? this.solution,
      status: status ?? this.status,
      description: description ?? this.description,
      employee: employee ?? this.employee,
      createdBy: createdBy ?? this.createdBy,
      priority: priority ?? this.priority,
      isComplaint: isComplaint ?? this.isComplaint,
      parentTicketId: parentTicketId ?? this.parentTicketId,
      syncState: syncState ?? this.syncState,
      auditTrail: auditTrail ?? this.auditTrail,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'row_id': rowId,
    'date': date,
    'time': time,
    'subscriber_name': subscriberName,
    'landline': landline,
    'mobile': mobile,
    'problem': problem,
    'solution': solution,
    'status': status,
    'description': description,
    'employee': employee,
    'created_by': createdBy,
    'priority': priority.name,
    'is_complaint': isComplaint,
    'parent_ticket_id': parentTicketId,
    'sync_state': syncState.name,
    'audit_trail': auditTrail.map((e) => e.toJson()).toList(),
    'updated_at': updatedAt.toIso8601String(),
  };

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    var rawAudit = json['audit_trail'];
    List<TicketAuditEntry> audit = [];
    if (rawAudit is List) {
      audit = rawAudit
          .whereType<Map<String, dynamic>>()
          .map((e) => TicketAuditEntry.fromJson(e))
          .toList();
    } else if (rawAudit is String && rawAudit.isNotEmpty) {
      try {
        final decoded = jsonDecode(rawAudit);
        if (decoded is List) {
          audit = decoded
              .whereType<Map<String, dynamic>>()
              .map((e) => TicketAuditEntry.fromJson(e))
              .toList();
        }
      } catch (_) {}
    }

    SyncState sync = SyncState.synced;
    if (json['sync_state'] != null) {
      for (final s in SyncState.values) {
        if (s.name == json['sync_state']) {
          sync = s;
          break;
        }
      }
    }

    return TicketModel(
      rowId: int.tryParse(json['row_id']?.toString() ?? '0') ?? 0,
      date: json['date']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      subscriberName: json['subscriber_name']?.toString() ?? '',
      landline: json['landline']?.toString() ?? '',
      mobile: json['mobile']?.toString() ?? '',
      problem: json['problem']?.toString() ?? '',
      solution: json['solution']?.toString() ?? '',
      status: json['status']?.toString() ?? 'قيد الحل',
      description: json['description']?.toString() ?? '',
      employee: json['employee']?.toString() ?? '',
      createdBy: json['created_by']?.toString() ?? '',
      priority: TicketPriority.fromString(json['priority']?.toString()),
      isComplaint:
          json['is_complaint'] == true ||
          json['is_complaint']?.toString() == 'true',
      parentTicketId: int.tryParse(json['parent_ticket_id']?.toString() ?? ''),
      syncState: sync,
      auditTrail: audit,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}
