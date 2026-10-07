import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift.freezed.dart';
part 'shift.g.dart';

/// الكيان الخاص بالوردية ومواعيد العمل (Shift Entity)
@freezed
abstract class Shift with _$Shift {
  const factory Shift({
    @JsonKey(name: 'shift_id') required String shiftId,
    @JsonKey(name: 'shift_name') required String shiftName,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'grace_period_mins') @Default(15) int gracePeriodMins,
    @JsonKey(name: 'overtime_threshold_mins')
    @Default(30)
    int overtimeThresholdMins,
    @JsonKey(name: 'early_checkin_mins') @Default(30) int earlyCheckinMins,
    @JsonKey(name: 'standard_hours') @Default(8.0) double standardHours,
    @JsonKey(name: 'applicable_roles')
    @Default([])
    List<String> applicableRoles,
    @JsonKey(name: 'work_days') @Default([]) List<String> workDays,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Shift;

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);
}
