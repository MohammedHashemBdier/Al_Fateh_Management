import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';

part 'overtime_record.freezed.dart';
part 'overtime_record.g.dart';

/// الكيان الخاص بساعات العمل الإضافي (Overtime Record Entity)
@freezed
abstract class OvertimeRecord with _$OvertimeRecord {
  const factory OvertimeRecord({
    @JsonKey(name: 'ot_id') required String otId,
    @JsonKey(name: 'attendance_id') required String attendanceId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'work_date') required String workDate,
    @JsonKey(name: 'duration_hours') @Default(0.0) double durationHours,
    @JsonKey(name: 'rate_multiplier') @Default(1.5) double rateMultiplier,
    @JsonKey(name: 'reason') @Default('') String reason,
    @JsonKey(name: 'status')
    @Default(OvertimeStatus.pending)
    OvertimeStatus status,
    @JsonKey(name: 'approved_by') String? approvedBy,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _OvertimeRecord;

  factory OvertimeRecord.fromJson(Map<String, dynamic> json) =>
      _$OvertimeRecordFromJson(json);
}
