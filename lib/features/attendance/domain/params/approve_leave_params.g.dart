// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_leave_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApproveLeaveParams _$ApproveLeaveParamsFromJson(Map<String, dynamic> json) =>
    _ApproveLeaveParams(
      leaveId: json['leave_id'] as String,
      approverId: json['approver_id'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ApproveLeaveParamsToJson(_ApproveLeaveParams instance) =>
    <String, dynamic>{
      'leave_id': instance.leaveId,
      'approver_id': instance.approverId,
      'notes': instance.notes,
    };
