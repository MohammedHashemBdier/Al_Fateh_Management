import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_correction_params.freezed.dart';
part 'request_correction_params.g.dart';

@freezed
abstract class RequestCorrectionParams with _$RequestCorrectionParams {
  const factory RequestCorrectionParams({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'attendance_id') required String attendanceId,
    @JsonKey(name: 'target_date') required String targetDate,
    @JsonKey(name: 'corrected_check_in') String? correctedCheckIn,
    @JsonKey(name: 'corrected_check_out') String? correctedCheckOut,
    @JsonKey(name: 'reason') required String reason,
  }) = _RequestCorrectionParams;

  factory RequestCorrectionParams.fromJson(Map<String, dynamic> json) =>
      _$RequestCorrectionParamsFromJson(json);
}
