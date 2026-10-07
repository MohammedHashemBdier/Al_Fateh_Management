// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overtime_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OvertimeRecord _$OvertimeRecordFromJson(Map<String, dynamic> json) =>
    _OvertimeRecord(
      otId: json['ot_id'] as String,
      attendanceId: json['attendance_id'] as String,
      userId: json['user_id'] as String,
      workDate: json['work_date'] as String,
      durationHours: (json['duration_hours'] as num?)?.toDouble() ?? 0.0,
      rateMultiplier: (json['rate_multiplier'] as num?)?.toDouble() ?? 1.5,
      reason: json['reason'] as String? ?? '',
      status:
          $enumDecodeNullable(_$OvertimeStatusEnumMap, json['status']) ??
          OvertimeStatus.pending,
      approvedBy: json['approved_by'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$OvertimeRecordToJson(_OvertimeRecord instance) =>
    <String, dynamic>{
      'ot_id': instance.otId,
      'attendance_id': instance.attendanceId,
      'user_id': instance.userId,
      'work_date': instance.workDate,
      'duration_hours': instance.durationHours,
      'rate_multiplier': instance.rateMultiplier,
      'reason': instance.reason,
      'status': _$OvertimeStatusEnumMap[instance.status]!,
      'approved_by': instance.approvedBy,
      'created_at': instance.createdAt,
    };

const _$OvertimeStatusEnumMap = {
  OvertimeStatus.pending: 'PENDING',
  OvertimeStatus.approved: 'APPROVED',
  OvertimeStatus.rejected: 'REJECTED',
};
