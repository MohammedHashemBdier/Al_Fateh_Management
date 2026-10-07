// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveRequest _$LeaveRequestFromJson(Map<String, dynamic> json) =>
    _LeaveRequest(
      leaveId: json['leave_id'] as String,
      userId: json['user_id'] as String,
      leaveType:
          $enumDecodeNullable(_$LeaveTypeEnumMap, json['leave_type']) ??
          LeaveType.annual,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      totalDaysOrHours:
          (json['total_days_or_hours'] as num?)?.toDouble() ?? 1.0,
      reason: json['reason'] as String? ?? '',
      status:
          $enumDecodeNullable(_$LeaveStatusEnumMap, json['status']) ??
          LeaveStatus.pending,
      approvedBy: json['approved_by'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$LeaveRequestToJson(_LeaveRequest instance) =>
    <String, dynamic>{
      'leave_id': instance.leaveId,
      'user_id': instance.userId,
      'leave_type': _$LeaveTypeEnumMap[instance.leaveType]!,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'total_days_or_hours': instance.totalDaysOrHours,
      'reason': instance.reason,
      'status': _$LeaveStatusEnumMap[instance.status]!,
      'approved_by': instance.approvedBy,
      'created_at': instance.createdAt,
    };

const _$LeaveTypeEnumMap = {
  LeaveType.annual: 'ANNUAL',
  LeaveType.sick: 'SICK',
  LeaveType.unpaid: 'UNPAID',
  LeaveType.emergency: 'EMERGENCY',
  LeaveType.maternity: 'MATERNITY',
};

const _$LeaveStatusEnumMap = {
  LeaveStatus.pending: 'PENDING',
  LeaveStatus.approved: 'APPROVED',
  LeaveStatus.rejected: 'REJECTED',
  LeaveStatus.cancelled: 'CANCELLED',
};
