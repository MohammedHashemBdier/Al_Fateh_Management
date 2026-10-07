import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/localization/attendance_error_mapper.dart';
import '../../../../core/services/connectivity/i_connectivity_service.dart';
import '../../../../core/services/sync/i_sync_service.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../domain/params/get_records_params.dart';
import '../../domain/params/get_today_status_params.dart';
import '../../domain/usecases/get_records_usecase.dart';
import '../../domain/usecases/get_settings_usecase.dart';
import '../../domain/usecases/get_shifts_usecase.dart';
import '../../domain/usecases/get_sites_usecase.dart';
import '../../domain/usecases/get_today_status_usecase.dart';
import '../../domain/usecases/sync_pending_operations_usecase.dart';
import 'attendance_state.dart';

@injectable
class AttendanceCubit extends Cubit<AttendanceState> {
  final GetTodayStatusUseCase _getTodayStatusUseCase;
  final GetSettingsUseCase _getSettingsUseCase;
  final GetShiftsUseCase _getShiftsUseCase;
  final GetSitesUseCase _getSitesUseCase;
  final GetRecordsUseCase _getRecordsUseCase;
  final SyncPendingOperationsUseCase _syncPendingOperationsUseCase;
  final IConnectivityService _connectivityService;
  final ISyncService _syncService;

  StreamSubscription<ConnectionStatus>? _connectivitySub;
  StreamSubscription<SyncStatusEvent>? _syncSub;

  AttendanceCubit({
    required this._getTodayStatusUseCase,
    required this._getSettingsUseCase,
    required this._getShiftsUseCase,
    required this._getSitesUseCase,
    required this._getRecordsUseCase,
    required this._syncPendingOperationsUseCase,
    required this._connectivityService,
    required this._syncService,
  }) : super(const AttendanceState()) {
    watchConnection();
    watchPendingCount();
  }

  @override
  Future<void> close() {
    _connectivitySub?.cancel();
    _syncSub?.cancel();
    return super.close();
  }

  /// مراقبة حالة الاتصال بالإنترنت
  void watchConnection() {
    _connectivitySub?.cancel();
    _connectivitySub = _connectivityService.statusStream.listen((status) {
      if (isClosed) return;
      emit(state.copyWith(connectionStatus: status));
    });
  }

  /// مراقبة طابور العمليات غير المتزامنة
  void watchPendingCount() {
    _syncSub?.cancel();
    _syncSub = _syncService.syncStatusStream.listen((event) {
      if (isClosed) return;
      emit(state.copyWith(pendingCount: event.pendingCount));
    });
  }

  /// تحميل البيانات الأولية للشاشة الرئيسية
  Future<void> loadInitialData({required String userId}) async {
    emit(state.copyWith(status: UIStatus.loading, errorMessage: null));

    try {
      final todayResult = await _getTodayStatusUseCase(
        GetTodayStatusParams(userId: userId),
      );
      final settingsResult = await _getSettingsUseCase(const NoParams());
      final shiftsResult = await _getShiftsUseCase(const NoParams());
      final sitesResult = await _getSitesUseCase(const NoParams());
      final recordsResult = await _getRecordsUseCase(
        GetRecordsParams(userId: userId, limit: 7),
      );

      final today = todayResult.when(success: (d) => d, failure: (_) => null);
      final settings = settingsResult.when(
        success: (d) => d,
        failure: (_) => null,
      );
      final shifts = shiftsResult.when(
        success: (d) => d,
        failure: (_) => state.shifts,
      );
      final sites = sitesResult.when(
        success: (d) => d,
        failure: (_) => state.sites,
      );
      final records = recordsResult.when(
        success: (d) => d,
        failure: (_) => state.recentRecords,
      );

      if (isClosed) return;
      emit(
        state.copyWith(
          status: UIStatus.loaded,
          todayStatus: today ?? state.todayStatus,
          settings: settings ?? state.settings,
          shifts: shifts,
          sites: sites,
          recentRecords: records,
          errorMessage: null,
        ),
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          status: UIStatus.error,
          errorMessage: AttendanceErrorMapper.mapException(e),
        ),
      );
    }
  }

  /// إعادة تحديث البيانات
  Future<void> refresh({required String userId}) async {
    emit(state.copyWith(status: UIStatus.refreshing));
    await loadInitialData(userId: userId);
  }

  /// مزامنة العمليات المعلقة فورياً
  Future<void> syncNow() async {
    emit(state.copyWith(status: UIStatus.syncing));
    try {
      await _syncPendingOperationsUseCase(const NoParams());
      if (isClosed) return;
      emit(state.copyWith(status: UIStatus.loaded));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(
          status: UIStatus.error,
          errorMessage: AttendanceErrorMapper.mapException(e),
        ),
      );
    }
  }

  /// جلب أحدث سجلات الدوام لمستخدم معين
  Future<void> loadRecentRecords({required String userId, int days = 7}) async {
    try {
      final res = await _getRecordsUseCase(
        GetRecordsParams(userId: userId, limit: days),
      );
      res.when(
        success: (data) {
          if (!isClosed) emit(state.copyWith(recentRecords: data));
        },
        failure: (f) {
          if (!isClosed) {
            emit(
              state.copyWith(errorMessage: AttendanceErrorMapper.mapFailure(f)),
            );
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(errorMessage: AttendanceErrorMapper.mapException(e)),
        );
      }
    }
  }
}
