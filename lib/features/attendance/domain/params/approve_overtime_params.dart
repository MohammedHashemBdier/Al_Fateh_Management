import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_overtime_params.freezed.dart';
part 'approve_overtime_params.g.dart';

@freezed
abstract class ApproveOvertimeParams with _$ApproveOvertimeParams {
  const factory ApproveOvertimeParams({
    @JsonKey(name: 'ot_id') required String otId,
    @JsonKey(name: 'approver_id') required String approverId,
    @JsonKey(name: 'notes') String? notes,
  }) = _ApproveOvertimeParams;

  factory ApproveOvertimeParams.fromJson(Map<String, dynamic> json) =>
      _$ApproveOvertimeParamsFromJson(json);
}
