import 'package:freezed_annotation/freezed_annotation.dart';

part 'reject_overtime_params.freezed.dart';
part 'reject_overtime_params.g.dart';

@freezed
abstract class RejectOvertimeParams with _$RejectOvertimeParams {
  const factory RejectOvertimeParams({
    @JsonKey(name: 'ot_id') required String otId,
    @JsonKey(name: 'approver_id') required String approverId,
    @JsonKey(name: 'reason') required String reason,
  }) = _RejectOvertimeParams;

  factory RejectOvertimeParams.fromJson(Map<String, dynamic> json) =>
      _$RejectOvertimeParamsFromJson(json);
}
