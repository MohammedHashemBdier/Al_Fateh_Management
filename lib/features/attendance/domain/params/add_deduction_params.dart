import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';

part 'add_deduction_params.freezed.dart';
part 'add_deduction_params.g.dart';

@freezed
abstract class AddDeductionParams with _$AddDeductionParams {
  const factory AddDeductionParams({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'work_date') required String workDate,
    @JsonKey(name: 'type') @Default(DeductionType.manual) DeductionType type,
    @JsonKey(name: 'amount_or_hours') required double amountOrHours,
    @JsonKey(name: 'reason') required String reason,
    @JsonKey(name: 'attendance_id') String? attendanceId,
    @JsonKey(name: 'created_by') String? createdBy,
  }) = _AddDeductionParams;

  factory AddDeductionParams.fromJson(Map<String, dynamic> json) =>
      _$AddDeductionParamsFromJson(json);
}
