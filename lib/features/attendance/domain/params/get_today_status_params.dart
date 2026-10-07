import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_today_status_params.freezed.dart';
part 'get_today_status_params.g.dart';

@freezed
abstract class GetTodayStatusParams with _$GetTodayStatusParams {
  const factory GetTodayStatusParams({
    @JsonKey(name: 'user_id') required String userId,
  }) = _GetTodayStatusParams;

  factory GetTodayStatusParams.fromJson(Map<String, dynamic> json) =>
      _$GetTodayStatusParamsFromJson(json);
}
