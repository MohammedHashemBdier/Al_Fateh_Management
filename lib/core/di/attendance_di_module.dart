import 'package:injectable/injectable.dart';

import '../../features/attendance/domain/domain.dart';

@module
abstract class AttendanceDiModule {
  @lazySingleton
  CheckInUseCase checkInUseCase(AttendanceRepository r) => CheckInUseCase(r);

  @lazySingleton
  CheckOutUseCase checkOutUseCase(AttendanceRepository r) => CheckOutUseCase(r);

  @lazySingleton
  GetTodayStatusUseCase getTodayStatusUseCase(AttendanceRepository r) =>
      GetTodayStatusUseCase(r);

  @lazySingleton
  GetRecordsUseCase getRecordsUseCase(AttendanceRepository r) =>
      GetRecordsUseCase(r);

  @lazySingleton
  GetRecordByIdUseCase getRecordByIdUseCase(AttendanceRepository r) =>
      GetRecordByIdUseCase(r);

  @lazySingleton
  GetShiftsUseCase getShiftsUseCase(AttendanceRepository r) =>
      GetShiftsUseCase(r);

  @lazySingleton
  GetSitesUseCase getSitesUseCase(AttendanceRepository r) => GetSitesUseCase(r);

  @lazySingleton
  GetSettingsUseCase getSettingsUseCase(AttendanceRepository r) =>
      GetSettingsUseCase(r);

  @lazySingleton
  RequestCorrectionUseCase requestCorrectionUseCase(AttendanceRepository r) =>
      RequestCorrectionUseCase(r);

  @lazySingleton
  GetCorrectionsUseCase getCorrectionsUseCase(AttendanceRepository r) =>
      GetCorrectionsUseCase(r);

  @lazySingleton
  ApproveCorrectionUseCase approveCorrectionUseCase(AttendanceRepository r) =>
      ApproveCorrectionUseCase(r);

  @lazySingleton
  RejectCorrectionUseCase rejectCorrectionUseCase(AttendanceRepository r) =>
      RejectCorrectionUseCase(r);

  @lazySingleton
  GetOvertimeUseCase getOvertimeUseCase(AttendanceRepository r) =>
      GetOvertimeUseCase(r);

  @lazySingleton
  AddOvertimeUseCase addOvertimeUseCase(AttendanceRepository r) =>
      AddOvertimeUseCase(r);

  @lazySingleton
  ApproveOvertimeUseCase approveOvertimeUseCase(AttendanceRepository r) =>
      ApproveOvertimeUseCase(r);

  @lazySingleton
  RejectOvertimeUseCase rejectOvertimeUseCase(AttendanceRepository r) =>
      RejectOvertimeUseCase(r);

  @lazySingleton
  GetLeavesUseCase getLeavesUseCase(AttendanceRepository r) =>
      GetLeavesUseCase(r);

  @lazySingleton
  SubmitLeaveUseCase submitLeaveUseCase(AttendanceRepository r) =>
      SubmitLeaveUseCase(r);

  @lazySingleton
  ApproveLeaveUseCase approveLeaveUseCase(AttendanceRepository r) =>
      ApproveLeaveUseCase(r);

  @lazySingleton
  RejectLeaveUseCase rejectLeaveUseCase(AttendanceRepository r) =>
      RejectLeaveUseCase(r);

  @lazySingleton
  GetDeductionsUseCase getDeductionsUseCase(AttendanceRepository r) =>
      GetDeductionsUseCase(r);

  @lazySingleton
  AddDeductionUseCase addDeductionUseCase(AttendanceRepository r) =>
      AddDeductionUseCase(r);

  @lazySingleton
  GetNotificationsUseCase getNotificationsUseCase(AttendanceRepository r) =>
      GetNotificationsUseCase(r);

  @lazySingleton
  MarkNotificationReadUseCase markNotificationReadUseCase(
    AttendanceRepository r,
  ) => MarkNotificationReadUseCase(r);

  @lazySingleton
  SyncPendingOperationsUseCase syncPendingOperationsUseCase(
    AttendanceRepository r,
  ) => SyncPendingOperationsUseCase(r);

  @lazySingleton
  AddShiftUseCase addShiftUseCase(AttendanceRepository r) => AddShiftUseCase(r);

  @lazySingleton
  UpdateShiftUseCase updateShiftUseCase(AttendanceRepository r) =>
      UpdateShiftUseCase(r);

  @lazySingleton
  DeleteShiftUseCase deleteShiftUseCase(AttendanceRepository r) =>
      DeleteShiftUseCase(r);

  @lazySingleton
  GetAuditLogsUseCase getAuditLogsUseCase(AttendanceRepository r) =>
      GetAuditLogsUseCase(r);
}
