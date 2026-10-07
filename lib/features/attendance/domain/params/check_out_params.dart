import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_out_params.freezed.dart';
part 'check_out_params.g.dart';

/// بارامترات تسجيل الانصراف الجغرافي (Check-Out Params)
@freezed
abstract class CheckOutParams with _$CheckOutParams {
  const factory CheckOutParams({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'lat') required double lat,
    @JsonKey(name: 'lng') required double lng,
    @JsonKey(name: 'accuracy') @Default(0.0) double accuracy,
    @JsonKey(name: 'is_mock') @Default(false) bool isMock,
    @JsonKey(name: 'site_id') String? siteId,
  }) = _CheckOutParams;

  factory CheckOutParams.fromJson(Map<String, dynamic> json) =>
      _$CheckOutParamsFromJson(json);
}
