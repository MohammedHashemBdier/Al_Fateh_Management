// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_deduction_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddDeductionParams _$AddDeductionParamsFromJson(Map<String, dynamic> json) =>
    _AddDeductionParams(
      userId: json['user_id'] as String,
      workDate: json['work_date'] as String,
      type:
          $enumDecodeNullable(_$DeductionTypeEnumMap, json['type']) ??
          DeductionType.manual,
      amountOrHours: (json['amount_or_hours'] as num).toDouble(),
      reason: json['reason'] as String,
      attendanceId: json['attendance_id'] as String?,
      createdBy: json['created_by'] as String?,
    );

Map<String, dynamic> _$AddDeductionParamsToJson(_AddDeductionParams instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'work_date': instance.workDate,
      'type': _$DeductionTypeEnumMap[instance.type]!,
      'amount_or_hours': instance.amountOrHours,
      'reason': instance.reason,
      'attendance_id': instance.attendanceId,
      'created_by': instance.createdBy,
    };

const _$DeductionTypeEnumMap = {
  DeductionType.late: 'LATE',
  DeductionType.earlyLeave: 'EARLY_LEAVE',
  DeductionType.absence: 'ABSENCE',
  DeductionType.penalty: 'PENALTY',
  DeductionType.manual: 'MANUAL',
};
