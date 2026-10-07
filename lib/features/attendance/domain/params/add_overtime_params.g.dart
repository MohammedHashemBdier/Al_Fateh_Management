// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_overtime_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddOvertimeParams _$AddOvertimeParamsFromJson(Map<String, dynamic> json) =>
    _AddOvertimeParams(
      userId: json['user_id'] as String,
      workDate: json['work_date'] as String,
      durationHours: (json['duration_hours'] as num).toDouble(),
      rateMultiplier: (json['rate_multiplier'] as num?)?.toDouble() ?? 1.5,
      reason: json['reason'] as String? ?? '',
      attendanceId: json['attendance_id'] as String?,
    );

Map<String, dynamic> _$AddOvertimeParamsToJson(_AddOvertimeParams instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'work_date': instance.workDate,
      'duration_hours': instance.durationHours,
      'rate_multiplier': instance.rateMultiplier,
      'reason': instance.reason,
      'attendance_id': instance.attendanceId,
    };
