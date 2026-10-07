import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attendance_enums.dart';

part 'app_notification.freezed.dart';
part 'app_notification.g.dart';

/// الكيان الخاص بإشعارات النظام والموظف (App Notification Entity)
@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'type')
    @Default(NotificationType.system)
    NotificationType type,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') required String body,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    @JsonKey(name: 'payload_json') String? payloadJson,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}
