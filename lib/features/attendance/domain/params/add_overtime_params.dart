import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_overtime_params.freezed.dart';
part 'add_overtime_params.g.dart';

@freezed
abstract class AddOvertimeParams with _$AddOvertimeParams {
  const factory AddOvertimeParams({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'work_date') required String workDate,
    @JsonKey(name: 'duration_hours') required double durationHours,
    @JsonKey(name: 'rate_multiplier') @Default(1.5) double rateMultiplier,
    @JsonKey(name: 'reason') @Default('') String reason,
    @JsonKey(name: 'attendance_id') String? attendanceId,
  }) = _AddOvertimeParams;

  factory AddOvertimeParams.fromJson(Map<String, dynamic> json) =>
      _$AddOvertimeParamsFromJson(json);
}
