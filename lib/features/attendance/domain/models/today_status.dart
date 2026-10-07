import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';
import 'attendance_record.dart';

part 'today_status.freezed.dart';
part 'today_status.g.dart';

/// ملخص حالة دوام الموظف لليوم الحالي (Today Status Entity)
@freezed
abstract class TodayStatus with _$TodayStatus {
  const factory TodayStatus({
    @JsonKey(name: 'has_checked_in') @Default(false) bool hasCheckedIn,
    @JsonKey(name: 'has_checked_out') @Default(false) bool hasCheckedOut,
    @JsonKey(name: 'status')
    @Default(AttendanceStatus.absent)
    AttendanceStatus status,
    @JsonKey(name: 'check_in_time') String? checkInTime,
    @JsonKey(name: 'check_out_time') String? checkOutTime,
    @JsonKey(name: 'record') AttendanceRecord? record,
  }) = _TodayStatus;

  factory TodayStatus.fromJson(Map<String, dynamic> json) =>
      _$TodayStatusFromJson(json);
}
