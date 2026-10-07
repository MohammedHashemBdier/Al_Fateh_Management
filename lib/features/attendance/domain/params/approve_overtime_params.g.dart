// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_overtime_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApproveOvertimeParams _$ApproveOvertimeParamsFromJson(
  Map<String, dynamic> json,
) => _ApproveOvertimeParams(
  otId: json['ot_id'] as String,
  approverId: json['approver_id'] as String,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$ApproveOvertimeParamsToJson(
  _ApproveOvertimeParams instance,
) => <String, dynamic>{
  'ot_id': instance.otId,
  'approver_id': instance.approverId,
  'notes': instance.notes,
};
