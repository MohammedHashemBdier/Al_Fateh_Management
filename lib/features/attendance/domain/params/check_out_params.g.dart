// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckOutParams _$CheckOutParamsFromJson(Map<String, dynamic> json) =>
    _CheckOutParams(
      userId: json['user_id'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0,
      isMock: json['is_mock'] as bool? ?? false,
      siteId: json['site_id'] as String?,
    );

Map<String, dynamic> _$CheckOutParamsToJson(_CheckOutParams instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'lat': instance.lat,
      'lng': instance.lng,
      'accuracy': instance.accuracy,
      'is_mock': instance.isMock,
      'site_id': instance.siteId,
    };
