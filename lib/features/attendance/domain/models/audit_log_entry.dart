import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log_entry.freezed.dart';
part 'audit_log_entry.g.dart';

@freezed
abstract class AuditLogEntry with _$AuditLogEntry {
  const factory AuditLogEntry({
    required String logId,
    required String timestamp,
    required String actorId,
    required String actorRole,
    required String action,
    String? recordId,
    String? oldValues,
    String? newValues,
    String? ipAddress,
    String? deviceFp,
    String? notes,
  }) = _AuditLogEntry;

  factory AuditLogEntry.fromJson(Map<String, dynamic> json) =>
      _$AuditLogEntryFromJson(json);
}
