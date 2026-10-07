import 'package:freezed_annotation/freezed_annotation.dart';

part 'reject_leave_params.freezed.dart';
part 'reject_leave_params.g.dart';

@freezed
abstract class RejectLeaveParams with _$RejectLeaveParams {
  const factory RejectLeaveParams({
    @JsonKey(name: 'leave_id') required String leaveId,
    @JsonKey(name: 'approver_id') required String approverId,
    @JsonKey(name: 'reason') required String reason,
  }) = _RejectLeaveParams;

  factory RejectLeaveParams.fromJson(Map<String, dynamic> json) =>
      _$RejectLeaveParamsFromJson(json);
}
