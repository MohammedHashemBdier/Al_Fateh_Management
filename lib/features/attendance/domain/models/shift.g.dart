// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Shift _$ShiftFromJson(Map<String, dynamic> json) => _Shift(
  shiftId: json['shift_id'] as String,
  shiftName: json['shift_name'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  gracePeriodMins: (json['grace_period_mins'] as num?)?.toInt() ?? 15,
  overtimeThresholdMins:
      (json['overtime_threshold_mins'] as num?)?.toInt() ?? 30,
  earlyCheckinMins: (json['early_checkin_mins'] as num?)?.toInt() ?? 30,
  standardHours: (json['standard_hours'] as num?)?.toDouble() ?? 8.0,
  applicableRoles:
      (json['applicable_roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  workDays:
      (json['work_days'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isActive: json['is_active'] as bool? ?? true,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$ShiftToJson(_Shift instance) => <String, dynamic>{
  'shift_id': instance.shiftId,
  'shift_name': instance.shiftName,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'grace_period_mins': instance.gracePeriodMins,
  'overtime_threshold_mins': instance.overtimeThresholdMins,
  'early_checkin_mins': instance.earlyCheckinMins,
  'standard_hours': instance.standardHours,
  'applicable_roles': instance.applicableRoles,
  'work_days': instance.workDays,
  'is_active': instance.isActive,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
