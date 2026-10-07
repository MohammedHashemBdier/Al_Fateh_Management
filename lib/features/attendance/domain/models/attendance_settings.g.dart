// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceSettings _$AttendanceSettingsFromJson(Map<String, dynamic> json) =>
    _AttendanceSettings(
      defaultGeofenceRadius:
          (json['default_geofence_radius'] as num?)?.toDouble() ?? 50.0,
      maxAllowedGpsAccuracy:
          (json['max_allowed_gps_accuracy'] as num?)?.toDouble() ?? 30.0,
      enableMockDetection: json['enable_mock_detection'] as bool? ?? true,
      allowBrowserCheckin: json['allow_browser_checkin'] as bool? ?? true,
      payrollLockDay: (json['payroll_lock_day'] as num?)?.toInt() ?? 28,
    );

Map<String, dynamic> _$AttendanceSettingsToJson(_AttendanceSettings instance) =>
    <String, dynamic>{
      'default_geofence_radius': instance.defaultGeofenceRadius,
      'max_allowed_gps_accuracy': instance.maxAllowedGpsAccuracy,
      'enable_mock_detection': instance.enableMockDetection,
      'allow_browser_checkin': instance.allowBrowserCheckin,
      'payroll_lock_day': instance.payrollLockDay,
    };
