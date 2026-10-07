import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_settings.freezed.dart';
part 'attendance_settings.g.dart';

/// إعدادات وضوابط نظام الدوام والحضور (Attendance Settings Entity)
@freezed
abstract class AttendanceSettings with _$AttendanceSettings {
  const factory AttendanceSettings({
    @JsonKey(name: 'default_geofence_radius')
    @Default(50.0)
    double defaultGeofenceRadius,
    @JsonKey(name: 'max_allowed_gps_accuracy')
    @Default(30.0)
    double maxAllowedGpsAccuracy,
    @JsonKey(name: 'enable_mock_detection')
    @Default(true)
    bool enableMockDetection,
    @JsonKey(name: 'allow_browser_checkin')
    @Default(true)
    bool allowBrowserCheckin,
    @JsonKey(name: 'payroll_lock_day') @Default(28) int payrollLockDay,
  }) = _AttendanceSettings;

  factory AttendanceSettings.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSettingsFromJson(json);
}
