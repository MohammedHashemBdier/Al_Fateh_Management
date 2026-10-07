// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_records_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetRecordsParams _$GetRecordsParamsFromJson(Map<String, dynamic> json) =>
    _GetRecordsParams(
      userId: json['user_id'] as String?,
      month: json['month'] as String?,
      date: json['date'] as String?,
      limit: (json['limit'] as num?)?.toInt() ?? 50,
    );

Map<String, dynamic> _$GetRecordsParamsToJson(_GetRecordsParams instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'month': instance.month,
      'date': instance.date,
      'limit': instance.limit,
    };
