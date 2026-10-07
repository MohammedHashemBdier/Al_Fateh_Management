// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/attendance/data/datasources/attendance_local_data_source.dart'
    as _i769;
import '../../features/attendance/data/datasources/attendance_remote_data_source.dart'
    as _i680;
import '../../features/attendance/data/repositories/attendance_repository_impl.dart'
    as _i719;
import '../../features/attendance/domain/domain.dart' as _i45;
import '../../features/attendance/domain/repositories/attendance_repository.dart'
    as _i477;
import '../../features/attendance/domain/usecases/add_shift_usecase.dart'
    as _i32;
import '../../features/attendance/domain/usecases/approve_correction_usecase.dart'
    as _i790;
import '../../features/attendance/domain/usecases/check_in_usecase.dart'
    as _i895;
import '../../features/attendance/domain/usecases/check_out_usecase.dart'
    as _i751;
import '../../features/attendance/domain/usecases/delete_shift_usecase.dart'
    as _i375;
import '../../features/attendance/domain/usecases/get_audit_logs_usecase.dart'
    as _i833;
import '../../features/attendance/domain/usecases/get_corrections_usecase.dart'
    as _i222;
import '../../features/attendance/domain/usecases/get_deductions_usecase.dart'
    as _i499;
import '../../features/attendance/domain/usecases/get_notifications_usecase.dart'
    as _i632;
import '../../features/attendance/domain/usecases/get_overtime_usecase.dart'
    as _i134;
import '../../features/attendance/domain/usecases/get_record_by_id_usecase.dart'
    as _i227;
import '../../features/attendance/domain/usecases/get_records_usecase.dart'
    as _i449;
import '../../features/attendance/domain/usecases/get_settings_usecase.dart'
    as _i448;
import '../../features/attendance/domain/usecases/get_shifts_usecase.dart'
    as _i132;
import '../../features/attendance/domain/usecases/get_sites_usecase.dart'
    as _i759;
import '../../features/attendance/domain/usecases/get_today_status_usecase.dart'
    as _i317;
import '../../features/attendance/domain/usecases/mark_notification_read_usecase.dart'
    as _i886;
import '../../features/attendance/domain/usecases/reject_correction_usecase.dart'
    as _i400;
import '../../features/attendance/domain/usecases/request_correction_usecase.dart'
    as _i944;
import '../../features/attendance/domain/usecases/sync_pending_operations_usecase.dart'
    as _i418;
import '../../features/attendance/domain/usecases/update_shift_usecase.dart'
    as _i26;
import '../../features/attendance/presentation/cubit/attendance_cubit.dart'
    as _i518;
import '../../features/attendance/presentation/cubit/attendance_details_cubit.dart'
    as _i86;
import '../../features/attendance/presentation/cubit/attendance_history_cubit.dart'
    as _i85;
import '../../features/attendance/presentation/cubit/attendance_reports_cubit.dart'
    as _i104;
import '../../features/attendance/presentation/cubit/check_in_cubit.dart'
    as _i743;
import '../../features/attendance/presentation/cubit/correction_cubit.dart'
    as _i282;
import '../../features/attendance/presentation/cubit/notifications_cubit.dart'
    as _i517;
import '../../features/attendance/presentation/cubit/shift_management_cubit.dart'
    as _i772;
import '../services/connectivity/app_connectivity_service.dart' as _i774;
import '../services/connectivity/i_connectivity_service.dart' as _i624;
import '../services/device_info/app_device_info_service.dart' as _i490;
import '../services/device_info/i_device_info_service.dart' as _i732;
import '../services/geofence/app_geofence_service.dart' as _i79;
import '../services/geofence/i_geofence_service.dart' as _i435;
import '../services/location/app_location_service.dart' as _i102;
import '../services/location/i_location_service.dart' as _i572;
import '../services/sync/app_sync_service.dart' as _i410;
import '../services/sync/i_sync_service.dart' as _i124;
import '../storage/hive_service.dart' as _i459;
import '../storage/i_local_storage.dart' as _i999;
import 'attendance_di_module.dart' as _i791;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final attendanceDiModule = _$AttendanceDiModule();
    gh.lazySingleton<_i624.IConnectivityService>(
      () => _i774.AppConnectivityService(),
    );
    gh.lazySingleton<_i572.ILocationService>(() => _i102.AppLocationService());
    gh.lazySingleton<_i680.AttendanceRemoteDataSource>(
      () => _i680.AttendanceRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i999.ILocalStorage>(() => _i459.HiveService());
    gh.lazySingleton<_i435.IGeofenceService>(() => _i79.AppGeofenceService());
    gh.lazySingleton<_i732.IDeviceInfoService>(
      () => _i490.AppDeviceInfoService(),
    );
    gh.lazySingleton<_i769.AttendanceLocalDataSource>(
      () => _i769.AttendanceLocalDataSourceImpl(gh<_i999.ILocalStorage>()),
    );
    gh.lazySingleton<_i477.AttendanceRepository>(
      () => _i719.AttendanceRepositoryImpl(
        gh<_i680.AttendanceRemoteDataSource>(),
        gh<_i769.AttendanceLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i45.CheckInUseCase>(
      () => attendanceDiModule.checkInUseCase(gh<_i45.AttendanceRepository>()),
    );
    gh.lazySingleton<_i45.CheckOutUseCase>(
      () => attendanceDiModule.checkOutUseCase(gh<_i45.AttendanceRepository>()),
    );
    gh.lazySingleton<_i45.GetTodayStatusUseCase>(
      () => attendanceDiModule.getTodayStatusUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.GetRecordsUseCase>(
      () =>
          attendanceDiModule.getRecordsUseCase(gh<_i45.AttendanceRepository>()),
    );
    gh.lazySingleton<_i45.GetRecordByIdUseCase>(
      () => attendanceDiModule.getRecordByIdUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.GetShiftsUseCase>(
      () =>
          attendanceDiModule.getShiftsUseCase(gh<_i45.AttendanceRepository>()),
    );
    gh.lazySingleton<_i45.GetSitesUseCase>(
      () => attendanceDiModule.getSitesUseCase(gh<_i45.AttendanceRepository>()),
    );
    gh.lazySingleton<_i45.GetSettingsUseCase>(
      () => attendanceDiModule.getSettingsUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.RequestCorrectionUseCase>(
      () => attendanceDiModule.requestCorrectionUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.GetCorrectionsUseCase>(
      () => attendanceDiModule.getCorrectionsUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.ApproveCorrectionUseCase>(
      () => attendanceDiModule.approveCorrectionUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.RejectCorrectionUseCase>(
      () => attendanceDiModule.rejectCorrectionUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.GetOvertimeUseCase>(
      () => attendanceDiModule.getOvertimeUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.AddOvertimeUseCase>(
      () => attendanceDiModule.addOvertimeUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.ApproveOvertimeUseCase>(
      () => attendanceDiModule.approveOvertimeUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.RejectOvertimeUseCase>(
      () => attendanceDiModule.rejectOvertimeUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.GetLeavesUseCase>(
      () =>
          attendanceDiModule.getLeavesUseCase(gh<_i45.AttendanceRepository>()),
    );
    gh.lazySingleton<_i45.SubmitLeaveUseCase>(
      () => attendanceDiModule.submitLeaveUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.ApproveLeaveUseCase>(
      () => attendanceDiModule.approveLeaveUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.RejectLeaveUseCase>(
      () => attendanceDiModule.rejectLeaveUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.GetDeductionsUseCase>(
      () => attendanceDiModule.getDeductionsUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.AddDeductionUseCase>(
      () => attendanceDiModule.addDeductionUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.GetNotificationsUseCase>(
      () => attendanceDiModule.getNotificationsUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.MarkNotificationReadUseCase>(
      () => attendanceDiModule.markNotificationReadUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.SyncPendingOperationsUseCase>(
      () => attendanceDiModule.syncPendingOperationsUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.AddShiftUseCase>(
      () => attendanceDiModule.addShiftUseCase(gh<_i45.AttendanceRepository>()),
    );
    gh.lazySingleton<_i45.UpdateShiftUseCase>(
      () => attendanceDiModule.updateShiftUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.DeleteShiftUseCase>(
      () => attendanceDiModule.deleteShiftUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.lazySingleton<_i45.GetAuditLogsUseCase>(
      () => attendanceDiModule.getAuditLogsUseCase(
        gh<_i45.AttendanceRepository>(),
      ),
    );
    gh.factory<_i743.CheckInCubit>(
      () => _i743.CheckInCubit(
        checkInUseCase: gh<_i895.CheckInUseCase>(),
        checkOutUseCase: gh<_i751.CheckOutUseCase>(),
        getSettingsUseCase: gh<_i448.GetSettingsUseCase>(),
        getSitesUseCase: gh<_i759.GetSitesUseCase>(),
        locationService: gh<_i572.ILocationService>(),
        geofenceService: gh<_i435.IGeofenceService>(),
        deviceInfoService: gh<_i732.IDeviceInfoService>(),
      ),
    );
    gh.factory<_i517.NotificationsCubit>(
      () => _i517.NotificationsCubit(
        getNotificationsUseCase: gh<_i632.GetNotificationsUseCase>(),
        markNotificationReadUseCase: gh<_i886.MarkNotificationReadUseCase>(),
      ),
    );
    gh.lazySingleton<_i124.ISyncService>(
      () => _i410.AppSyncService(
        gh<_i477.AttendanceRepository>(),
        gh<_i624.IConnectivityService>(),
      ),
    );
    gh.factory<_i85.AttendanceHistoryCubit>(
      () => _i85.AttendanceHistoryCubit(
        getRecordsUseCase: gh<_i449.GetRecordsUseCase>(),
      ),
    );
    gh.factory<_i282.CorrectionCubit>(
      () => _i282.CorrectionCubit(
        getCorrectionsUseCase: gh<_i222.GetCorrectionsUseCase>(),
        requestCorrectionUseCase: gh<_i944.RequestCorrectionUseCase>(),
        approveCorrectionUseCase: gh<_i790.ApproveCorrectionUseCase>(),
        rejectCorrectionUseCase: gh<_i400.RejectCorrectionUseCase>(),
      ),
    );
    gh.factory<_i772.ShiftManagementCubit>(
      () => _i772.ShiftManagementCubit(
        getShiftsUseCase: gh<_i132.GetShiftsUseCase>(),
        addShiftUseCase: gh<_i32.AddShiftUseCase>(),
        updateShiftUseCase: gh<_i26.UpdateShiftUseCase>(),
        deleteShiftUseCase: gh<_i375.DeleteShiftUseCase>(),
      ),
    );
    gh.factory<_i518.AttendanceCubit>(
      () => _i518.AttendanceCubit(
        getTodayStatusUseCase: gh<_i317.GetTodayStatusUseCase>(),
        getSettingsUseCase: gh<_i448.GetSettingsUseCase>(),
        getShiftsUseCase: gh<_i132.GetShiftsUseCase>(),
        getSitesUseCase: gh<_i759.GetSitesUseCase>(),
        getRecordsUseCase: gh<_i449.GetRecordsUseCase>(),
        syncPendingOperationsUseCase: gh<_i418.SyncPendingOperationsUseCase>(),
        connectivityService: gh<_i624.IConnectivityService>(),
        syncService: gh<_i124.ISyncService>(),
      ),
    );
    gh.factory<_i86.AttendanceDetailsCubit>(
      () => _i86.AttendanceDetailsCubit(
        getRecordByIdUseCase: gh<_i227.GetRecordByIdUseCase>(),
        getAuditLogsUseCase: gh<_i833.GetAuditLogsUseCase>(),
      ),
    );
    gh.factory<_i104.AttendanceReportsCubit>(
      () => _i104.AttendanceReportsCubit(
        getRecordsUseCase: gh<_i449.GetRecordsUseCase>(),
        getDeductionsUseCase: gh<_i499.GetDeductionsUseCase>(),
        getOvertimeUseCase: gh<_i134.GetOvertimeUseCase>(),
      ),
    );
    return this;
  }
}

class _$AttendanceDiModule extends _i791.AttendanceDiModule {}
