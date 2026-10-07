// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_overtime_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RejectOvertimeParams _$RejectOvertimeParamsFromJson(
  Map<String, dynamic> json,
) => _RejectOvertimeParams(
  otId: json['ot_id'] as String,
  approverId: json['approver_id'] as String,
  reason: json['reason'] as String,
);

Map<String, dynamic> _$RejectOvertimeParamsToJson(
  _RejectOvertimeParams instance,
) => <String, dynamic>{
  'ot_id': instance.otId,
  'approver_id': instance.approverId,
  'reason': instance.reason,
};
