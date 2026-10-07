// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceRecord _$AttendanceRecordFromJson(Map<String, dynamic> json) =>
    _AttendanceRecord(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      date: json['date'] as String,
      shiftId: json['shift_id'] as String?,
      checkInTime: json['check_in_time'] as String?,
      checkInLat: (json['check_in_lat'] as num?)?.toDouble(),
      checkInLng: (json['check_in_lng'] as num?)?.toDouble(),
      checkInSiteId: json['check_in_site_id'] as String?,
      checkOutTime: json['check_out_time'] as String?,
      checkOutLat: (json['check_out_lat'] as num?)?.toDouble(),
      checkOutLng: (json['check_out_lng'] as num?)?.toDouble(),
      checkOutSiteId: json['check_out_site_id'] as String?,
      actualHours: (json['actual_hours'] as num?)?.toDouble() ?? 0.0,
      lateMinutes: (json['late_minutes'] as num?)?.toInt() ?? 0,
      earlyLeaveMinutes: (json['early_leave_minutes'] as num?)?.toInt() ?? 0,
      overtimeHours: (json['overtime_hours'] as num?)?.toDouble() ?? 0.0,
      status:
          $enumDecodeNullable(_$AttendanceStatusEnumMap, json['status']) ??
          AttendanceStatus.present,
      geofenceStatus:
          $enumDecodeNullable(
            _$GeofenceStatusEnumMap,
            json['geofence_status'],
          ) ??
          GeofenceStatus.inside,
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      mockLocationDetected: json['mock_location_detected'] as bool? ?? false,
      deviceId: json['device_id'] as String?,
      ipAddress: json['ip_address'] as String?,
      syncStatus:
          $enumDecodeNullable(_$SyncStatusEnumMap, json['sync_status']) ??
          SyncStatus.synced,
      isLocked: json['is_locked'] as bool? ?? false,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: json['created_by'] as String?,
      updatedBy: json['updated_by'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$AttendanceRecordToJson(_AttendanceRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'date': instance.date,
      'shift_id': instance.shiftId,
      'check_in_time': instance.checkInTime,
      'check_in_lat': instance.checkInLat,
      'check_in_lng': instance.checkInLng,
      'check_in_site_id': instance.checkInSiteId,
      'check_out_time': instance.checkOutTime,
      'check_out_lat': instance.checkOutLat,
      'check_out_lng': instance.checkOutLng,
      'check_out_site_id': instance.checkOutSiteId,
      'actual_hours': instance.actualHours,
      'late_minutes': instance.lateMinutes,
      'early_leave_minutes': instance.earlyLeaveMinutes,
      'overtime_hours': instance.overtimeHours,
      'status': _$AttendanceStatusEnumMap[instance.status]!,
      'geofence_status': _$GeofenceStatusEnumMap[instance.geofenceStatus]!,
      'accuracy': instance.accuracy,
      'mock_location_detected': instance.mockLocationDetected,
      'device_id': instance.deviceId,
      'ip_address': instance.ipAddress,
      'sync_status': _$SyncStatusEnumMap[instance.syncStatus]!,
      'is_locked': instance.isLocked,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'deleted_at': instance.deletedAt,
    };

const _$AttendanceStatusEnumMap = {
  AttendanceStatus.present: 'PRESENT',
  AttendanceStatus.late: 'LATE',
  AttendanceStatus.absent: 'ABSENT',
  AttendanceStatus.onLeave: 'ON_LEAVE',
  AttendanceStatus.holiday: 'HOLIDAY',
  AttendanceStatus.halfDay: 'HALF_DAY',
  AttendanceStatus.earlyLeave: 'EARLY_LEAVE',
};

const _$GeofenceStatusEnumMap = {
  GeofenceStatus.inside: 'INSIDE',
  GeofenceStatus.outside: 'OUTSIDE',
  GeofenceStatus.disabled: 'DISABLED',
  GeofenceStatus.manual: 'MANUAL',
};

const _$SyncStatusEnumMap = {
  SyncStatus.synced: 'SYNCED',
  SyncStatus.pending: 'PENDING',
  SyncStatus.failed: 'FAILED',
  SyncStatus.conflict: 'CONFLICT',
};
