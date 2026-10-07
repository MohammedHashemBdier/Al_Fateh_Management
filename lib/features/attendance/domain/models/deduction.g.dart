// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deduction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Deduction _$DeductionFromJson(Map<String, dynamic> json) => _Deduction(
  deductionId: json['deduction_id'] as String,
  userId: json['user_id'] as String,
  attendanceId: json['attendance_id'] as String?,
  deductionDate: json['deduction_date'] as String,
  type:
      $enumDecodeNullable(_$DeductionTypeEnumMap, json['type']) ??
      DeductionType.manual,
  amountOrHours: (json['amount_or_hours'] as num?)?.toDouble() ?? 0.0,
  reason: json['reason'] as String? ?? '',
  status: json['status'] as String? ?? 'APPLIED',
  createdBy: json['created_by'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$DeductionToJson(_Deduction instance) =>
    <String, dynamic>{
      'deduction_id': instance.deductionId,
      'user_id': instance.userId,
      'attendance_id': instance.attendanceId,
      'deduction_date': instance.deductionDate,
      'type': _$DeductionTypeEnumMap[instance.type]!,
      'amount_or_hours': instance.amountOrHours,
      'reason': instance.reason,
      'status': instance.status,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
    };

const _$DeductionTypeEnumMap = {
  DeductionType.late: 'LATE',
  DeductionType.earlyLeave: 'EARLY_LEAVE',
  DeductionType.absence: 'ABSENCE',
  DeductionType.penalty: 'PENALTY',
  DeductionType.manual: 'MANUAL',
};
