import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';

part 'submit_leave_params.freezed.dart';
part 'submit_leave_params.g.dart';

@freezed
abstract class SubmitLeaveParams with _$SubmitLeaveParams {
  const factory SubmitLeaveParams({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'leave_type') @Default(LeaveType.annual) LeaveType leaveType,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'total_days_or_hours') @Default(1.0) double totalDaysOrHours,
    @JsonKey(name: 'reason') @Default('') String reason,
  }) = _SubmitLeaveParams;

  factory SubmitLeaveParams.fromJson(Map<String, dynamic> json) =>
      _$SubmitLeaveParamsFromJson(json);
}
