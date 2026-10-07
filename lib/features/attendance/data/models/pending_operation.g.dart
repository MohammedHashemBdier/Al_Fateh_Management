// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PendingOperation _$PendingOperationFromJson(Map<String, dynamic> json) =>
    _PendingOperation(
      id: json['id'] as String,
      type: json['type'] as String,
      payload: json['payload'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['createdAt'] as String),
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      lastError: json['lastError'] as String?,
    );

Map<String, dynamic> _$PendingOperationToJson(_PendingOperation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'payload': instance.payload,
      'createdAt': instance.createdAt.toIso8601String(),
      'retryCount': instance.retryCount,
      'lastError': instance.lastError,
    };
