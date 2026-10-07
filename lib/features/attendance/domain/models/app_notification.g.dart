// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      type:
          $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']) ??
          NotificationType.system,
      title: json['title'] as String,
      body: json['body'] as String,
      isRead: json['is_read'] as bool? ?? false,
      payloadJson: json['payload_json'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$AppNotificationToJson(_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'body': instance.body,
      'is_read': instance.isRead,
      'payload_json': instance.payloadJson,
      'created_at': instance.createdAt,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.attendance: 'ATTENDANCE',
  NotificationType.correction: 'CORRECTION',
  NotificationType.overtime: 'OVERTIME',
  NotificationType.leave: 'LEAVE',
  NotificationType.system: 'SYSTEM',
};
