import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/localization/attendance_error_mapper.dart';
import '../../../../core/services/device_info/i_device_info_service.dart';
import '../../../../core/services/geofence/i_geofence_service.dart';
import '../../../../core/services/location/i_location_service.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../domain/models/site_geofence.dart';
import '../../domain/params/check_in_params.dart';
import '../../domain/params/check_out_params.dart';
import '../../domain/usecases/check_in_usecase.dart';
import '../../domain/usecases/check_out_usecase.dart';
import '../../domain/usecases/get_settings_usecase.dart';
import '../../domain/usecases/get_sites_usecase.dart';
import 'check_in_state.dart';

@injectable
class CheckInCubit extends Cubit<CheckInState> {
  final CheckInUseCase _checkInUseCase;
  final CheckOutUseCase _checkOutUseCase;
  final GetSettingsUseCase _getSettingsUseCase;
  final GetSitesUseCase _getSitesUseCase;
  final ILocationService _locationService;
  final IGeofenceService _geofenceService;
  final IDeviceInfoService _deviceInfoService;

  List<SiteGeofence> _cachedSites = [];

  CheckInCubit({
    required this._checkInUseCase,
    required this._checkOutUseCase,
    required this._getSettingsUseCase,
    required this._getSitesUseCase,
    required this._locationService,
    required this._geofenceService,
    required this._deviceInfoService,
  }) : super(const CheckInState());

  /// تحميل الموقع الجغرافي والتحقق من النطاق الجغرافي
  Future<void> loadLocation() async {
    emit(state.copyWith(isCheckingLocation: true, errorMessage: null));

    try {
      // 1. جلب إعدادات الدوام والمواقع إن لم تكن متوفرة
      if (state.settings == null) {
        final settingsRes = await _getSettingsUseCase(const NoParams());
        settingsRes.when(
          success: (s) => emit(state.copyWith(settings: s)),
          failure: (_) {},
        );
      }

      if (_cachedSites.isEmpty) {
        final sitesRes = await _getSitesUseCase(const NoParams());
        sitesRes.when(
          success: (sites) {
            _cachedSites = sites;
            _geofenceService.cacheSites(sites);
          },
          failure: (_) {
            _cachedSites = _geofenceService.getCachedSites() ?? [];
          },
        );
      }

      // 2. التحقق من تفعيل خدمة الـ GPS
      final isGpsOn = await _locationService.isLocationServiceEnabled();
      if (!isGpsOn) {
        if (isClosed) return;
        emit(
          state.copyWith(
            isCheckingLocation: false,
            isGpsDisabled: true,
            canSubmit: false,
            errorMessage:
                'خدمة تحديد الموقع (GPS) غير مفعلة، يرجى تفعيلها أولاً',
          ),
        );
        return;
      }

      // 3. التحقق من صلاحيات الموقع
      var permission = await _locationService.checkPermission();
      if (permission == LocationPermissionStatus.denied) {
        permission = await _locationService.requestPermission();
      }

      if (permission == LocationPermissionStatus.denied) {
        if (isClosed) return;
        emit(
          state.copyWith(
            isCheckingLocation: false,
            isPermissionDenied: true,
            canSubmit: false,
            errorMessage:
                'يرجى منح إذن الوصول إلى الموقع الجغرافي لتسجيل الدوام',
          ),
        );
        return;
      }

      if (permission == LocationPermissionStatus.deniedForever) {
        if (isClosed) return;
        emit(
          state.copyWith(
            isCheckingLocation: false,
            isPermissionDeniedForever: true,
            canSubmit: false,
            errorMessage:
                'تم رفض إذن الموقع بشكل دائم، يرجى تفعيله من إعدادات التطبيق',
          ),
        );
        return;
      }

      // 4. قراءة الإحداثيات الحالية
      final position = await _locationService.getCurrentPosition();
      final isMock = _locationService.isMockLocation(position);

      // 5. فحص النطاق الجغرافي
      final geofenceRes = await _geofenceService.checkGeofence(
        lat: position.latitude,
        lng: position.longitude,
        sites: _cachedSites,
        customRadius: state.settings?.defaultGeofenceRadius.toDouble(),
      );

      final canSubmit =
          !isMock &&
          geofenceRes.isInside &&
          (state.settings == null ||
              position.accuracy <= state.settings!.maxAllowedGpsAccuracy);

      String? error;
      if (isMock) {
        error = 'تم اكتشاف تزييف بالموقع الجغرافي (Mock GPS)، تم حظر التسجيل';
      } else if (!geofenceRes.isInside) {
        error =
            'أنت خارج النطاق الجغرافي المسموح لمقر الشركة (${geofenceRes.distanceMeters.toStringAsFixed(1)} م)';
      } else if (state.settings != null &&
          position.accuracy > state.settings!.maxAllowedGpsAccuracy) {
        error =
            'دقة الـ GPS غير كافية (${position.accuracy.toStringAsFixed(1)} م)، يرجى تفعيل الموقع عالي الدقة';
      }

      if (isClosed) return;
      emit(
        state.copyWith(
          isCheckingLocation: false,
          currentPosition: position,
          isMockLocation: isMock,
          isPermissionDenied: false,
          isPermissionDeniedForever: false,
          isGpsDisabled: false,
          geofenceResult: geofenceRes,
          canSubmit: canSubmit,
          errorMessage: error,
        ),
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          isCheckingLocation: false,
          errorMessage: AttendanceErrorMapper.mapException(e),
        ),
      );
    }
  }

  /// إعادة فحص وتحديث الموقع
  Future<void> refreshLocation() async {
    await loadLocation();
  }

  /// تسجيل الحضور (Check-In)
  Future<void> submitCheckIn({
    required String userId,
    String? shiftId,
    String? notes,
  }) async {
    if (!state.canSubmit || state.currentPosition == null) {
      emit(
        state.copyWith(
          errorMessage:
              state.errorMessage ??
              'لا يمكن تسجيل الحضور، يرجى فحص الموقع الجغرافي أولاً',
        ),
      );
      return;
    }

    emit(state.copyWith(status: UIStatus.loading, errorMessage: null));

    try {
      final pos = state.currentPosition!;
      final deviceId = await _deviceInfoService.getDeviceId();
      final siteId = state.geofenceResult?.matchedSite?.siteId ?? 'SITE-HQ';

      final params = CheckInParams(
        userId: userId,
        lat: pos.latitude,
        lng: pos.longitude,
        siteId: siteId,
        accuracy: pos.accuracy,
        isMock: state.isMockLocation,
        deviceId: deviceId,
      );

      final res = await _checkInUseCase(params);

      res.when(
        success: (record) {
          if (!isClosed) {
            emit(
              state.copyWith(
                status: UIStatus.loaded,
                lastRecord: record,
                errorMessage: null,
              ),
            );
          }
        },
        failure: (f) {
          if (!isClosed) {
            emit(
              state.copyWith(
                status: UIStatus.error,
                errorMessage: AttendanceErrorMapper.mapFailure(f),
              ),
            );
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            status: UIStatus.error,
            errorMessage: AttendanceErrorMapper.mapException(e),
          ),
        );
      }
    }
  }

  /// تسجيل الانصراف (Check-Out)
  Future<void> submitCheckOut({
    required String userId,
    String? recordId,
    String? notes,
  }) async {
    emit(state.copyWith(status: UIStatus.loading, errorMessage: null));

    try {
      final pos =
          state.currentPosition ??
          Position(
            longitude: 0.0,
            latitude: 0.0,
            timestamp: DateTime.now(),
            accuracy: 0.0,
            altitude: 0.0,
            altitudeAccuracy: 0.0,
            heading: 0.0,
            headingAccuracy: 0.0,
            speed: 0.0,
            speedAccuracy: 0.0,
          );

      final siteId = state.geofenceResult?.matchedSite?.siteId;

      final params = CheckOutParams(
        userId: userId,
        lat: pos.latitude,
        lng: pos.longitude,
        siteId: siteId,
        accuracy: pos.accuracy,
        isMock: state.isMockLocation,
      );

      final res = await _checkOutUseCase(params);

      res.when(
        success: (record) {
          if (!isClosed) {
            emit(
              state.copyWith(
                status: UIStatus.loaded,
                lastRecord: record,
                errorMessage: null,
              ),
            );
          }
        },
        failure: (f) {
          if (!isClosed) {
            emit(
              state.copyWith(
                status: UIStatus.error,
                errorMessage: AttendanceErrorMapper.mapFailure(f),
              ),
            );
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            status: UIStatus.error,
            errorMessage: AttendanceErrorMapper.mapException(e),
          ),
        );
      }
    }
  }

  /// فتح إعدادات الموقع بالجهاز
  Future<void> openLocationSettings() =>
      _locationService.openLocationSettings();

  /// فتح إعدادات أذونات التطبيق
  Future<void> openAppSettings() => _locationService.openAppSettings();

  /// إعادة تعيين الحالة
  void reset() => emit(const CheckInState());
}
