import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_notifications_params.freezed.dart';
part 'get_notifications_params.g.dart';

@freezed
abstract class GetNotificationsParams with _$GetNotificationsParams {
  const factory GetNotificationsParams({
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'unread_only') @Default(false) bool unreadOnly,
  }) = _GetNotificationsParams;

  factory GetNotificationsParams.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationsParamsFromJson(json);
}
