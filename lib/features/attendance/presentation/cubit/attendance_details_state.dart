import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../domain/models/attendance_record.dart';
import '../../domain/models/audit_log_entry.dart';

part 'attendance_details_state.freezed.dart';

@freezed
abstract class AttendanceDetailsState with _$AttendanceDetailsState {
  const factory AttendanceDetailsState({
    @Default(UIStatus.initial) UIStatus status,
    AttendanceRecord? record,
    @Default([]) List<AuditLogEntry> auditLog,
    String? errorMessage,
  }) = _AttendanceDetailsState;
}
