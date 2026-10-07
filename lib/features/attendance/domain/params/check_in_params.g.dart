// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInParams _$CheckInParamsFromJson(Map<String, dynamic> json) =>
    _CheckInParams(
      userId: json['user_id'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0,
      isMock: json['is_mock'] as bool? ?? false,
      deviceId: json['device_id'] as String?,
      siteId: json['site_id'] as String?,
    );

Map<String, dynamic> _$CheckInParamsToJson(_CheckInParams instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'lat': instance.lat,
      'lng': instance.lng,
      'accuracy': instance.accuracy,
      'is_mock': instance.isMock,
      'device_id': instance.deviceId,
      'site_id': instance.siteId,
    };
