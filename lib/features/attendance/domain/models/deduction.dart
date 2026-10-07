import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';

part 'deduction.freezed.dart';
part 'deduction.g.dart';

/// الكيان الخاص بالخصومات المالية والزمنية (Deduction Entity)
@freezed
abstract class Deduction with _$Deduction {
  const factory Deduction({
    @JsonKey(name: 'deduction_id') required String deductionId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'attendance_id') String? attendanceId,
    @JsonKey(name: 'deduction_date') required String deductionDate,
    @JsonKey(name: 'type') @Default(DeductionType.manual) DeductionType type,
    @JsonKey(name: 'amount_or_hours') @Default(0.0) double amountOrHours,
    @JsonKey(name: 'reason') @Default('') String reason,
    @JsonKey(name: 'status') @Default('APPLIED') String status,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Deduction;

  factory Deduction.fromJson(Map<String, dynamic> json) =>
      _$DeductionFromJson(json);
}
