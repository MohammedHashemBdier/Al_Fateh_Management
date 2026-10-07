import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';

part 'correction_request.freezed.dart';
part 'correction_request.g.dart';

/// الكيان الخاص بطلب تصحيح دوام (Correction Request Entity)
@freezed
abstract class CorrectionRequest with _$CorrectionRequest {
  const factory CorrectionRequest({
    @JsonKey(name: 'request_id') required String requestId,
    @JsonKey(name: 'attendance_id') required String attendanceId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'target_date') required String targetDate,
    @JsonKey(name: 'corrected_check_in') String? correctedCheckIn,
    @JsonKey(name: 'corrected_check_out') String? correctedCheckOut,
    @JsonKey(name: 'reason') @Default('') String reason,
    @JsonKey(name: 'status')
    @Default(CorrectionStatus.pending)
    CorrectionStatus status,
    @JsonKey(name: 'approver_id') String? approverId,
    @JsonKey(name: 'decision_notes') String? decisionNotes,
    @JsonKey(name: 'action_date') String? actionDate,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _CorrectionRequest;

  factory CorrectionRequest.fromJson(Map<String, dynamic> json) =>
      _$CorrectionRequestFromJson(json);
}
