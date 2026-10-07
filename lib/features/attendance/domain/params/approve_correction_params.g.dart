// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_correction_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApproveCorrectionParams _$ApproveCorrectionParamsFromJson(
  Map<String, dynamic> json,
) => _ApproveCorrectionParams(
  requestId: json['request_id'] as String,
  approverId: json['approver_id'] as String,
  decision: json['decision'] as String? ?? 'APPROVED',
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$ApproveCorrectionParamsToJson(
  _ApproveCorrectionParams instance,
) => <String, dynamic>{
  'request_id': instance.requestId,
  'approver_id': instance.approverId,
  'decision': instance.decision,
  'notes': instance.notes,
};
