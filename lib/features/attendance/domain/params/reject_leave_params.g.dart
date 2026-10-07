// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_leave_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RejectLeaveParams _$RejectLeaveParamsFromJson(Map<String, dynamic> json) =>
    _RejectLeaveParams(
      leaveId: json['leave_id'] as String,
      approverId: json['approver_id'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$RejectLeaveParamsToJson(_RejectLeaveParams instance) =>
    <String, dynamic>{
      'leave_id': instance.leaveId,
      'approver_id': instance.approverId,
      'reason': instance.reason,
    };
