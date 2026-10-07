import 'package:json_annotation/json_annotation.dart';

/// حالة الدوام التشغيلية للموظف
enum AttendanceStatus {
  @JsonValue('PRESENT')
  present('حاضر', 'Present'),

  @JsonValue('LATE')
  late('متأخر', 'Late'),

  @JsonValue('ABSENT')
  absent('غائب', 'Absent'),

  @JsonValue('ON_LEAVE')
  onLeave('إجازة', 'On Leave'),

  @JsonValue('HOLIDAY')
  holiday('عطلة رسمية', 'Holiday'),

  @JsonValue('HALF_DAY')
  halfDay('نصف يوم', 'Half Day'),

  @JsonValue('EARLY_LEAVE')
  earlyLeave('مغادرة مبكرة', 'Early Leave');

  final String labelAr;
  final String labelEn;

  const AttendanceStatus(this.labelAr, this.labelEn);

  static AttendanceStatus fromString(String? val) {
    if (val == null) return AttendanceStatus.present;
    final clean = val.trim().toUpperCase();
    for (final s in AttendanceStatus.values) {
      if (s.name.toUpperCase() == clean ||
          s.labelAr == val.trim() ||
          s.labelEn.toUpperCase() == clean) {
        return s;
      }
    }
    return AttendanceStatus.present;
  }
}

/// حالة النطاق الجغرافي لتسجيل الحضور/الانصراف
enum GeofenceStatus {
  @JsonValue('INSIDE')
  inside('داخل النطاق', 'Inside'),

  @JsonValue('OUTSIDE')
  outside('خارج النطاق', 'Outside'),

  @JsonValue('DISABLED')
  disabled('معطل / معفى', 'Disabled'),

  @JsonValue('MANUAL')
  manual('تصحيح يدوي', 'Manual');

  final String labelAr;
  final String labelEn;

  const GeofenceStatus(this.labelAr, this.labelEn);

  static GeofenceStatus fromString(String? val) {
    if (val == null) return GeofenceStatus.inside;
    final clean = val.trim().toUpperCase();
    for (final g in GeofenceStatus.values) {
      if (g.name.toUpperCase() == clean ||
          g.labelAr == val.trim() ||
          g.labelEn.toUpperCase() == clean) {
        return g;
      }
    }
    return GeofenceStatus.inside;
  }
}

/// حالة مزامنة السجل مع السيرفر السحابي
enum SyncStatus {
  @JsonValue('SYNCED')
  synced('متزامن', 'Synced'),

  @JsonValue('PENDING')
  pending('معلق للمزامنة', 'Pending'),

  @JsonValue('FAILED')
  failed('فشل المزامنة', 'Failed'),

  @JsonValue('CONFLICT')
  conflict('تعارض بيانات', 'Conflict');

  final String labelAr;
  final String labelEn;

  const SyncStatus(this.labelAr, this.labelEn);

  static SyncStatus fromString(String? val) {
    if (val == null) return SyncStatus.synced;
    final clean = val.trim().toUpperCase();
    for (final s in SyncStatus.values) {
      if (s.name.toUpperCase() == clean ||
          s.labelAr == val.trim() ||
          s.labelEn.toUpperCase() == clean) {
        return s;
      }
    }
    return SyncStatus.synced;
  }
}

/// حالة طلب تصحيح الدوام
enum CorrectionStatus {
  @JsonValue('PENDING')
  pending('قيد المراجعة', 'Pending'),

  @JsonValue('APPROVED')
  approved('معتمد', 'Approved'),

  @JsonValue('REJECTED')
  rejected('مرفوض', 'Rejected'),

  @JsonValue('CANCELLED')
  cancelled('ملغى', 'Cancelled');

  final String labelAr;
  final String labelEn;

  const CorrectionStatus(this.labelAr, this.labelEn);

  static CorrectionStatus fromString(String? val) {
    if (val == null) return CorrectionStatus.pending;
    final clean = val.trim().toUpperCase();
    for (final s in CorrectionStatus.values) {
      if (s.name.toUpperCase() == clean ||
          s.labelAr == val.trim() ||
          s.labelEn.toUpperCase() == clean) {
        return s;
      }
    }
    return CorrectionStatus.pending;
  }
}

/// حالة ساعات العمل الإضافي
enum OvertimeStatus {
  @JsonValue('PENDING')
  pending('قيد الاعتماد', 'Pending'),

  @JsonValue('APPROVED')
  approved('معتمد', 'Approved'),

  @JsonValue('REJECTED')
  rejected('مرفوض', 'Rejected');

  final String labelAr;
  final String labelEn;

  const OvertimeStatus(this.labelAr, this.labelEn);

  static OvertimeStatus fromString(String? val) {
    if (val == null) return OvertimeStatus.pending;
    final clean = val.trim().toUpperCase();
    for (final s in OvertimeStatus.values) {
      if (s.name.toUpperCase() == clean ||
          s.labelAr == val.trim() ||
          s.labelEn.toUpperCase() == clean) {
        return s;
      }
    }
    return OvertimeStatus.pending;
  }
}

/// حالة طلب الإجازة
enum LeaveStatus {
  @JsonValue('PENDING')
  pending('قيد المراجعة', 'Pending'),

  @JsonValue('APPROVED')
  approved('معتمد', 'Approved'),

  @JsonValue('REJECTED')
  rejected('مرفوض', 'Rejected'),

  @JsonValue('CANCELLED')
  cancelled('ملغى', 'Cancelled');

  final String labelAr;
  final String labelEn;

  const LeaveStatus(this.labelAr, this.labelEn);

  static LeaveStatus fromString(String? val) {
    if (val == null) return LeaveStatus.pending;
    final clean = val.trim().toUpperCase();
    for (final s in LeaveStatus.values) {
      if (s.name.toUpperCase() == clean ||
          s.labelAr == val.trim() ||
          s.labelEn.toUpperCase() == clean) {
        return s;
      }
    }
    return LeaveStatus.pending;
  }
}

/// نوع الإجازة المطلوبة
enum LeaveType {
  @JsonValue('ANNUAL')
  annual('إجازة سنوية', 'Annual Leave'),

  @JsonValue('SICK')
  sick('إجازة مرضية', 'Sick Leave'),

  @JsonValue('UNPAID')
  unpaid('إجازة بلا راتب', 'Unpaid Leave'),

  @JsonValue('EMERGENCY')
  emergency('إجازة طارئة', 'Emergency Leave'),

  @JsonValue('MATERNITY')
  maternity('إجازة أمومة', 'Maternity Leave');

  final String labelAr;
  final String labelEn;

  const LeaveType(this.labelAr, this.labelEn);

  static LeaveType fromString(String? val) {
    if (val == null) return LeaveType.annual;
    final clean = val.trim().toUpperCase();
    for (final t in LeaveType.values) {
      if (t.name.toUpperCase() == clean ||
          t.labelAr == val.trim() ||
          t.labelEn.toUpperCase() == clean) {
        return t;
      }
    }
    return LeaveType.annual;
  }
}

/// نوع الخصم المالي أو الزمني
enum DeductionType {
  @JsonValue('LATE')
  late('تأخير صباحي', 'Late Penalty'),

  @JsonValue('EARLY_LEAVE')
  earlyLeave('انصراف مبكر', 'Early Leave Penalty'),

  @JsonValue('ABSENCE')
  absence('غياب غير مبرر', 'Absence Penalty'),

  @JsonValue('PENALTY')
  penalty('عقوبة إدارية', 'Disciplinary Penalty'),

  @JsonValue('MANUAL')
  manual('خصم يدوي مخصص', 'Manual Deduction');

  final String labelAr;
  final String labelEn;

  const DeductionType(this.labelAr, this.labelEn);

  static DeductionType fromString(String? val) {
    if (val == null) return DeductionType.manual;
    final clean = val.trim().toUpperCase();
    for (final t in DeductionType.values) {
      if (t.name.toUpperCase() == clean ||
          t.labelAr == val.trim() ||
          t.labelEn.toUpperCase() == clean) {
        return t;
      }
    }
    return DeductionType.manual;
  }
}

/// نوع الإشعار في التطبيق
enum NotificationType {
  @JsonValue('ATTENDANCE')
  attendance('حضور وانصراف', 'Attendance'),

  @JsonValue('CORRECTION')
  correction('طلب تصحيح', 'Correction Request'),

  @JsonValue('OVERTIME')
  overtime('ساعات إضافية', 'Overtime'),

  @JsonValue('LEAVE')
  leave('طلب إجازة', 'Leave Request'),

  @JsonValue('SYSTEM')
  system('تنبيه نظام', 'System Notification');

  final String labelAr;
  final String labelEn;

  const NotificationType(this.labelAr, this.labelEn);

  static NotificationType fromString(String? val) {
    if (val == null) return NotificationType.system;
    final clean = val.trim().toUpperCase();
    for (final t in NotificationType.values) {
      if (t.name.toUpperCase() == clean ||
          t.labelAr == val.trim() ||
          t.labelEn.toUpperCase() == clean) {
        return t;
      }
    }
    return NotificationType.system;
  }
}
