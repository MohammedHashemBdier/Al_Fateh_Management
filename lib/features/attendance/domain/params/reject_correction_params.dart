import 'package:freezed_annotation/freezed_annotation.dart';

part 'reject_correction_params.freezed.dart';
part 'reject_correction_params.g.dart';

@freezed
abstract class RejectCorrectionParams with _$RejectCorrectionParams {
  const factory RejectCorrectionParams({
    @JsonKey(name: 'request_id') required String requestId,
    @JsonKey(name: 'approver_id') required String approverId,
    @JsonKey(name: 'reason') required String reason,
  }) = _RejectCorrectionParams;

  factory RejectCorrectionParams.fromJson(Map<String, dynamic> json) =>
      _$RejectCorrectionParamsFromJson(json);
}
