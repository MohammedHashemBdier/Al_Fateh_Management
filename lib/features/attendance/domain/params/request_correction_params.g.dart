// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_correction_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestCorrectionParams _$RequestCorrectionParamsFromJson(
  Map<String, dynamic> json,
) => _RequestCorrectionParams(
  userId: json['user_id'] as String,
  attendanceId: json['attendance_id'] as String,
  targetDate: json['target_date'] as String,
  correctedCheckIn: json['corrected_check_in'] as String?,
  correctedCheckOut: json['corrected_check_out'] as String?,
  reason: json['reason'] as String,
);

Map<String, dynamic> _$RequestCorrectionParamsToJson(
  _RequestCorrectionParams instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'attendance_id': instance.attendanceId,
  'target_date': instance.targetDate,
  'corrected_check_in': instance.correctedCheckIn,
  'corrected_check_out': instance.correctedCheckOut,
  'reason': instance.reason,
};
