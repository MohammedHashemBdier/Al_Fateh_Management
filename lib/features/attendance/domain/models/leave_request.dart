import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';

part 'leave_request.freezed.dart';
part 'leave_request.g.dart';

/// الكيان الخاص بطلب الإجازة (Leave Request Entity)
@freezed
abstract class LeaveRequest with _$LeaveRequest {
  const factory LeaveRequest({
    @JsonKey(name: 'leave_id') required String leaveId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'leave_type') @Default(LeaveType.annual) LeaveType leaveType,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'total_days_or_hours') @Default(1.0) double totalDaysOrHours,
    @JsonKey(name: 'reason') @Default('') String reason,
    @JsonKey(name: 'status') @Default(LeaveStatus.pending) LeaveStatus status,
    @JsonKey(name: 'approved_by') String? approvedBy,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _LeaveRequest;

  factory LeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestFromJson(json);
}
