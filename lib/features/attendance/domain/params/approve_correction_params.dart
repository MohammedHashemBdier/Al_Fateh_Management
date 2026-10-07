import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_correction_params.freezed.dart';
part 'approve_correction_params.g.dart';

@freezed
abstract class ApproveCorrectionParams with _$ApproveCorrectionParams {
  const factory ApproveCorrectionParams({
    @JsonKey(name: 'request_id') required String requestId,
    @JsonKey(name: 'approver_id') required String approverId,
    @JsonKey(name: 'decision') @Default('APPROVED') String decision,
    @JsonKey(name: 'notes') String? notes,
  }) = _ApproveCorrectionParams;

  factory ApproveCorrectionParams.fromJson(Map<String, dynamic> json) =>
      _$ApproveCorrectionParamsFromJson(json);
}
