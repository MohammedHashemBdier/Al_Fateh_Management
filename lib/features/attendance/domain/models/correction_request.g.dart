// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CorrectionRequest _$CorrectionRequestFromJson(Map<String, dynamic> json) =>
    _CorrectionRequest(
      requestId: json['request_id'] as String,
      attendanceId: json['attendance_id'] as String,
      userId: json['user_id'] as String,
      targetDate: json['target_date'] as String,
      correctedCheckIn: json['corrected_check_in'] as String?,
      correctedCheckOut: json['corrected_check_out'] as String?,
      reason: json['reason'] as String? ?? '',
      status:
          $enumDecodeNullable(_$CorrectionStatusEnumMap, json['status']) ??
          CorrectionStatus.pending,
      approverId: json['approver_id'] as String?,
      decisionNotes: json['decision_notes'] as String?,
      actionDate: json['action_date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CorrectionRequestToJson(_CorrectionRequest instance) =>
    <String, dynamic>{
      'request_id': instance.requestId,
      'attendance_id': instance.attendanceId,
      'user_id': instance.userId,
      'target_date': instance.targetDate,
      'corrected_check_in': instance.correctedCheckIn,
      'corrected_check_out': instance.correctedCheckOut,
      'reason': instance.reason,
      'status': _$CorrectionStatusEnumMap[instance.status]!,
      'approver_id': instance.approverId,
      'decision_notes': instance.decisionNotes,
      'action_date': instance.actionDate,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$CorrectionStatusEnumMap = {
  CorrectionStatus.pending: 'PENDING',
  CorrectionStatus.approved: 'APPROVED',
  CorrectionStatus.rejected: 'REJECTED',
  CorrectionStatus.cancelled: 'CANCELLED',
};
