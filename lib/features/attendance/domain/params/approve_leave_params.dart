import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_leave_params.freezed.dart';
part 'approve_leave_params.g.dart';

@freezed
abstract class ApproveLeaveParams with _$ApproveLeaveParams {
  const factory ApproveLeaveParams({
    @JsonKey(name: 'leave_id') required String leaveId,
    @JsonKey(name: 'approver_id') required String approverId,
    @JsonKey(name: 'notes') String? notes,
  }) = _ApproveLeaveParams;

  factory ApproveLeaveParams.fromJson(Map<String, dynamic> json) =>
      _$ApproveLeaveParamsFromJson(json);
}
