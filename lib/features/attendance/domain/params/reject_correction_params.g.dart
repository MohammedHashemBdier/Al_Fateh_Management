// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_correction_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RejectCorrectionParams _$RejectCorrectionParamsFromJson(
  Map<String, dynamic> json,
) => _RejectCorrectionParams(
  requestId: json['request_id'] as String,
  approverId: json['approver_id'] as String,
  reason: json['reason'] as String,
);

Map<String, dynamic> _$RejectCorrectionParamsToJson(
  _RejectCorrectionParams instance,
) => <String, dynamic>{
  'request_id': instance.requestId,
  'approver_id': instance.approverId,
  'reason': instance.reason,
};
