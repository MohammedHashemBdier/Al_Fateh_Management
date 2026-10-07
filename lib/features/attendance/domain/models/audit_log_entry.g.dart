// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditLogEntry _$AuditLogEntryFromJson(Map<String, dynamic> json) =>
    _AuditLogEntry(
      logId: json['logId'] as String,
      timestamp: json['timestamp'] as String,
      actorId: json['actorId'] as String,
      actorRole: json['actorRole'] as String,
      action: json['action'] as String,
      recordId: json['recordId'] as String?,
      oldValues: json['oldValues'] as String?,
      newValues: json['newValues'] as String?,
      ipAddress: json['ipAddress'] as String?,
      deviceFp: json['deviceFp'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AuditLogEntryToJson(_AuditLogEntry instance) =>
    <String, dynamic>{
      'logId': instance.logId,
      'timestamp': instance.timestamp,
      'actorId': instance.actorId,
      'actorRole': instance.actorRole,
      'action': instance.action,
      'recordId': instance.recordId,
      'oldValues': instance.oldValues,
      'newValues': instance.newValues,
      'ipAddress': instance.ipAddress,
      'deviceFp': instance.deviceFp,
      'notes': instance.notes,
    };
