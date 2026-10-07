import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/services/connectivity/i_connectivity_service.dart';
import '../../domain/models/attendance_record.dart';
import '../../domain/models/attendance_settings.dart';
import '../../domain/models/shift.dart';
import '../../domain/models/site_geofence.dart';
import '../../domain/models/today_status.dart';

part 'attendance_state.freezed.dart';

@freezed
abstract class AttendanceState with _$AttendanceState {
  const factory AttendanceState({
    @Default(UIStatus.initial) UIStatus status,
    TodayStatus? todayStatus,
    AttendanceSettings? settings,
    @Default([]) List<Shift> shifts,
    @Default([]) List<SiteGeofence> sites,
    @Default([]) List<AttendanceRecord> recentRecords,
    ConnectionStatus? connectionStatus,
    @Default(0) int pendingCount,
    String? errorMessage,
  }) = _AttendanceState;
}
