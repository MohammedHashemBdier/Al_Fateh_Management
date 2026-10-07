// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceFilter _$AttendanceFilterFromJson(Map<String, dynamic> json) =>
    _AttendanceFilter(
      fromDate: json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      toDate: json['toDate'] == null
          ? null
          : DateTime.parse(json['toDate'] as String),
      status: $enumDecodeNullable(_$AttendanceStatusEnumMap, json['status']),
      userId: json['userId'] as String?,
      departmentId: json['departmentId'] as String?,
      siteId: json['siteId'] as String?,
      searchQuery: json['searchQuery'] as String?,
    );

Map<String, dynamic> _$AttendanceFilterToJson(_AttendanceFilter instance) =>
    <String, dynamic>{
      'fromDate': instance.fromDate?.toIso8601String(),
      'toDate': instance.toDate?.toIso8601String(),
      'status': _$AttendanceStatusEnumMap[instance.status],
      'userId': instance.userId,
      'departmentId': instance.departmentId,
      'siteId': instance.siteId,
      'searchQuery': instance.searchQuery,
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
