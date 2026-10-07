import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_params.freezed.dart';
part 'check_in_params.g.dart';

/// بارامترات تسجيل الحضور الجغرافي (Check-In Params)
@freezed
abstract class CheckInParams with _$CheckInParams {
  const factory CheckInParams({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'lng') required double lng,
    @JsonKey(name: 'accuracy') @Default(0.0) double accuracy,
    @JsonKey(name: 'is_mock') @Default(false) bool isMock,
    @JsonKey(name: 'device_id') String? deviceId,
    @JsonKey(name: 'site_id') String? siteId,
  }) = _CheckInParams;

  factory CheckInParams.fromJson(Map<String, dynamic> json) =>
      _$CheckInParamsFromJson(json);
}
