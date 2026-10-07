import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/services/geofence/i_geofence_service.dart';
import '../../domain/models/attendance_record.dart';
import '../../domain/models/attendance_settings.dart';

part 'check_in_state.freezed.dart';

@freezed
abstract class CheckInState with _$CheckInState {
  const factory CheckInState({
    @Default(UIStatus.initial) UIStatus status,
    Position? currentPosition,
    GeofenceResult? geofenceResult,
    @Default(false) bool isMockLocation,
    @Default(false) bool isPermissionDenied,
    @Default(false) bool isPermissionDeniedForever,
    @Default(false) bool isGpsDisabled,
    @Default(false) bool isCheckingLocation,
    String? errorMessage,
    AttendanceRecord? lastRecord,
    @Default(true) bool canSubmit,
    AttendanceSettings? settings,
  }) = _CheckInState;
}
