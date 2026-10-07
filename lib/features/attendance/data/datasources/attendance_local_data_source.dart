import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/storage/hive_service.dart';
import '../../../../core/storage/i_local_storage.dart';
import '../models/attendance_models.dart';

abstract class AttendanceLocalDataSource {
  // Records
  Future<void> cacheRecords(List<AttendanceRecordModel> records);
  Future<List<AttendanceRecordModel>> getCachedRecords();
  Future<AttendanceRecordModel?> getCachedTodayRecord({required String userId});
  Future<void> cacheRecord(AttendanceRecordModel record);

  // Config
  Future<void> cacheShifts(List<ShiftModel> shifts);
  Future<List<ShiftModel>> getCachedShifts();
  Future<void> cacheSites(List<SiteGeofenceModel> sites);
  Future<List<SiteGeofenceModel>> getCachedSites();
  Future<void> cacheSettings(AttendanceSettingsModel settings);
  Future<AttendanceSettingsModel?> getCachedSettings();

  // Pending Operations
  Future<void> queueOperation(PendingOperation operation);
  Future<List<PendingOperation>> getPendingOperations();
  Future<void> removeOperation(String operationId);
  Future<void> updateOperation(String operationId, PendingOperation operation);
  Future<int> getPendingOperationsCount();

  // Notifications
  Future<void> cacheNotifications(List<AppNotificationModel> notifications);
  Future<List<AppNotificationModel>> getCachedNotifications();

  // Clear
  Future<void> clearAll();
}

@LazySingleton(as: AttendanceLocalDataSource)
class AttendanceLocalDataSourceImpl implements AttendanceLocalDataSource {
  final ILocalStorage _storage;

  AttendanceLocalDataSourceImpl(this._storage);

  @override
  Future<void> cacheRecords(List<AttendanceRecordModel> records) async {
    for (final r in records) {
      await cacheRecord(r);
    }
  }

  @override
  Future<List<AttendanceRecordModel>> getCachedRecords() async {
    try {
      final list = await _storage.readAll(HiveService.boxAttendanceRecords);
      return list.map((item) {
        if (item is Map) {
          return AttendanceRecordModel.fromJson(
            Map<String, dynamic>.from(item),
          );
        } else if (item is String) {
          return AttendanceRecordModel.fromJson(
            jsonDecode(item) as Map<String, dynamic>,
          );
        }
        throw FormatException('Invalid record type: $item');
      }).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<AttendanceRecordModel?> getCachedTodayRecord({
    required String userId,
  }) async {
    final records = await getCachedRecords();
    final today = DateTime.now().toIso8601String().substring(0, 10);
    try {
      return records.firstWhere(
        (r) => r.userId == userId && r.date.startsWith(today),
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> cacheRecord(AttendanceRecordModel record) async {
    await _storage.write(
      HiveService.boxAttendanceRecords,
      record.id,
      record.toJson(),
    );
  }

  @override
  Future<void> cacheShifts(List<ShiftModel> shifts) async {
    await _storage.clear(HiveService.boxAttendanceShifts);
    for (final s in shifts) {
      await _storage.write(
        HiveService.boxAttendanceShifts,
        s.shiftId,
        s.toJson(),
      );
    }
  }

  @override
  Future<List<ShiftModel>> getCachedShifts() async {
    try {
      final list = await _storage.readAll(HiveService.boxAttendanceShifts);
      return list.map((item) {
        return ShiftModel.fromJson(Map<String, dynamic>.from(item as Map));
      }).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> cacheSites(List<SiteGeofenceModel> sites) async {
    await _storage.clear(HiveService.boxAttendanceSites);
    for (final s in sites) {
      await _storage.write(
        HiveService.boxAttendanceSites,
        s.siteId,
        s.toJson(),
      );
    }
  }

  @override
  Future<List<SiteGeofenceModel>> getCachedSites() async {
    try {
      final list = await _storage.readAll(HiveService.boxAttendanceSites);
      return list.map((item) {
        return SiteGeofenceModel.fromJson(
          Map<String, dynamic>.from(item as Map),
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> cacheSettings(AttendanceSettingsModel settings) async {
    await _storage.write(
      HiveService.boxAttendanceSettings,
      'global_settings',
      settings.toJson(),
    );
  }

  @override
  Future<AttendanceSettingsModel?> getCachedSettings() async {
    try {
      final map = await _storage.read<Map>(
        HiveService.boxAttendanceSettings,
        'global_settings',
      );
      if (map != null) {
        return AttendanceSettingsModel.fromJson(Map<String, dynamic>.from(map));
      }
    } catch (_) {}
    return null;
  }

  @override
  Future<void> queueOperation(PendingOperation operation) async {
    await _storage.write(
      HiveService.boxAttendancePendingOps,
      operation.id,
      operation.toJson(),
    );
  }

  @override
  Future<List<PendingOperation>> getPendingOperations() async {
    try {
      final list = await _storage.readAll(HiveService.boxAttendancePendingOps);
      return list.map((item) {
        return PendingOperation.fromJson(
          Map<String, dynamic>.from(item as Map),
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> removeOperation(String operationId) async {
    await _storage.delete(HiveService.boxAttendancePendingOps, operationId);
  }

  @override
  Future<void> updateOperation(
    String operationId,
    PendingOperation operation,
  ) async {
    await _storage.write(
      HiveService.boxAttendancePendingOps,
      operationId,
      operation.toJson(),
    );
  }

  @override
  Future<int> getPendingOperationsCount() async {
    final list = await getPendingOperations();
    return list.length;
  }

  @override
  Future<void> cacheNotifications(
    List<AppNotificationModel> notifications,
  ) async {
    await _storage.clear(HiveService.boxAttendanceNotifications);
    for (final n in notifications) {
      await _storage.write(
        HiveService.boxAttendanceNotifications,
        n.id,
        n.toJson(),
      );
    }
  }

  @override
  Future<List<AppNotificationModel>> getCachedNotifications() async {
    try {
      final list = await _storage.readAll(
        HiveService.boxAttendanceNotifications,
      );
      return list.map((item) {
        return AppNotificationModel.fromJson(
          Map<String, dynamic>.from(item as Map),
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  Future<void> clearAll() async {
    for (final boxName in HiveService.allBoxes) {
      await _storage.clear(boxName);
    }
  }
}
