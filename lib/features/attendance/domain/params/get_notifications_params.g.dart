// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notifications_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetNotificationsParams _$GetNotificationsParamsFromJson(
  Map<String, dynamic> json,
) => _GetNotificationsParams(
  userId: json['user_id'] as String?,
  unreadOnly: json['unread_only'] as bool? ?? false,
);

Map<String, dynamic> _$GetNotificationsParamsToJson(
  _GetNotificationsParams instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'unread_only': instance.unreadOnly,
};
