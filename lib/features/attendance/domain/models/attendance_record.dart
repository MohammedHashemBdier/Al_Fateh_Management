import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';

part 'attendance_record.freezed.dart';
part 'attendance_record.g.dart';

/// الكيان الكامل لسجل الحضور والانصراف (Attendance Record Entity)
@freezed
abstract class AttendanceRecord with _$AttendanceRecord {
  const factory AttendanceRecord({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'shift_id') String? shiftId,
    @JsonKey(name: 'check_in_time') String? checkInTime,
    @JsonKey(name: 'check_in_lat') double? checkInLat,
    @JsonKey(name: 'check_in_lng') double? checkInLng,
    @JsonKey(name: 'check_in_site_id') String? checkInSiteId,
    @JsonKey(name: 'check_out_time') String? checkOutTime,
    @JsonKey(name: 'check_out_lat') double? checkOutLat,
    @JsonKey(name: 'check_out_lng') double? checkOutLng,
    @JsonKey(name: 'check_out_site_id') String? checkOutSiteId,
    @JsonKey(name: 'actual_hours') @Default(0.0) double actualHours,
    @JsonKey(name: 'late_minutes') @Default(0) int lateMinutes,
    @JsonKey(name: 'early_leave_minutes') @Default(0) int earlyLeaveMinutes,
    @JsonKey(name: 'overtime_hours') @Default(0.0) double overtimeHours,
    @JsonKey(name: 'status')
    @Default(AttendanceStatus.present)
    AttendanceStatus status,
    @JsonKey(name: 'geofence_status')
    @Default(GeofenceStatus.inside)
    GeofenceStatus geofenceStatus,
    @JsonKey(name: 'accuracy') double? accuracy,
    @JsonKey(name: 'mock_location_detected')
    @Default(false)
    bool mockLocationDetected,
    @JsonKey(name: 'device_id') String? deviceId,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'sync_status')
    @Default(SyncStatus.synced)
    SyncStatus syncStatus,
    @JsonKey(name: 'is_locked') @Default(false) bool isLocked,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'updated_by') String? updatedBy,
    @JsonKey(name: 'deleted_at') String? deletedAt,
  }) = _AttendanceRecord;

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordFromJson(json);
}
