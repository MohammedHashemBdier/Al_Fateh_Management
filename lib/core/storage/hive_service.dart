import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'i_local_storage.dart';

@LazySingleton(as: ILocalStorage)
class HiveService implements ILocalStorage {
  static const String boxAttendanceRecords = 'attendance_records';
  static const String boxAttendanceSettings = 'attendance_settings';
  static const String boxAttendanceShifts = 'attendance_shifts';
  static const String boxAttendanceSites = 'attendance_sites';
  static const String boxAttendancePendingOps = 'attendance_pending_operations';
  static const String boxAttendanceNotifications = 'attendance_notifications';

  static const List<String> allBoxes = [
    boxAttendanceRecords,
    boxAttendanceSettings,
    boxAttendanceShifts,
    boxAttendanceSites,
    boxAttendancePendingOps,
    boxAttendanceNotifications,
  ];

  bool _isInitialized = false;

  @override
  Future<void> init() async {
    if (_isInitialized) return;
    await Hive.initFlutter();

    for (final boxName in allBoxes) {
      if (!Hive.isBoxOpen(boxName)) {
        await Hive.openBox(boxName);
      }
    }
    _isInitialized = true;
  }

  Box _getBox(String boxName) {
    if (!Hive.isBoxOpen(boxName)) {
      throw StateError('Hive box "$boxName" is not open. Call init() first.');
    }
    return Hive.box(boxName);
  }

  @override
  Future<void> write(String boxName, String key, dynamic value) async {
    final box = _getBox(boxName);
    await box.put(key, value);
  }

  @override
  Future<T?> read<T>(String boxName, String key) async {
    final box = _getBox(boxName);
    final val = box.get(key);
    if (val is T) return val;
    return null;
  }

  @override
  Future<List<dynamic>> readAll(String boxName) async {
    final box = _getBox(boxName);
    return box.values.toList();
  }

  @override
  Future<void> delete(String boxName, String key) async {
    final box = _getBox(boxName);
    await box.delete(key);
  }

  @override
  Future<void> clear(String boxName) async {
    final box = _getBox(boxName);
    await box.clear();
  }

  @override
  Future<bool> containsKey(String boxName, String key) async {
    final box = _getBox(boxName);
    return box.containsKey(key);
  }
}
