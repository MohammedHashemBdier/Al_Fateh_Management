// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodayStatus _$TodayStatusFromJson(Map<String, dynamic> json) => _TodayStatus(
  hasCheckedIn: json['has_checked_in'] as bool? ?? false,
  hasCheckedOut: json['has_checked_out'] as bool? ?? false,
  status:
      $enumDecodeNullable(_$AttendanceStatusEnumMap, json['status']) ??
      AttendanceStatus.absent,
  checkInTime: json['check_in_time'] as String?,
  checkOutTime: json['check_out_time'] as String?,
  record: json['record'] == null
      ? null
      : AttendanceRecord.fromJson(json['record'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TodayStatusToJson(_TodayStatus instance) =>
    <String, dynamic>{
      'has_checked_in': instance.hasCheckedIn,
      'has_checked_out': instance.hasCheckedOut,
      'status': _$AttendanceStatusEnumMap[instance.status]!,
      'check_in_time': instance.checkInTime,
      'check_out_time': instance.checkOutTime,
      'record': instance.record,
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
