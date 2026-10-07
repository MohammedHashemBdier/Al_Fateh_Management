// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_leave_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmitLeaveParams _$SubmitLeaveParamsFromJson(Map<String, dynamic> json) =>
    _SubmitLeaveParams(
      userId: json['user_id'] as String,
      leaveType:
          $enumDecodeNullable(_$LeaveTypeEnumMap, json['leave_type']) ??
          LeaveType.annual,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      totalDaysOrHours:
          (json['total_days_or_hours'] as num?)?.toDouble() ?? 1.0,
      reason: json['reason'] as String? ?? '',
    );

Map<String, dynamic> _$SubmitLeaveParamsToJson(_SubmitLeaveParams instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'leave_type': _$LeaveTypeEnumMap[instance.leaveType]!,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'total_days_or_hours': instance.totalDaysOrHours,
      'reason': instance.reason,
    };

const _$LeaveTypeEnumMap = {
  LeaveType.annual: 'ANNUAL',
  LeaveType.sick: 'SICK',
  LeaveType.unpaid: 'UNPAID',
  LeaveType.emergency: 'EMERGENCY',
  LeaveType.maternity: 'MATERNITY',
};
