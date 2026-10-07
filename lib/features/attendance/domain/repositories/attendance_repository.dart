import '../../../../core/contracts/base_repository.dart';
import '../../../../core/contracts/result.dart';
import '../models/app_notification.dart';
import '../models/attendance_record.dart';
import '../models/attendance_settings.dart';
import '../models/audit_log_entry.dart';
import '../models/correction_request.dart';
import '../models/deduction.dart';
import '../models/leave_request.dart';
import '../models/overtime_record.dart';
import '../models/shift.dart';
import '../models/site_geofence.dart';
import '../models/today_status.dart';
import '../params/check_in_params.dart';
import '../params/check_out_params.dart';
import '../params/request_correction_params.dart';
import '../params/approve_correction_params.dart';
import '../params/reject_correction_params.dart';
import '../params/add_overtime_params.dart';
import '../params/approve_overtime_params.dart';
import '../params/reject_overtime_params.dart';
import '../params/submit_leave_params.dart';
import '../params/approve_leave_params.dart';
import '../params/reject_leave_params.dart';
import '../params/add_deduction_params.dart';

/// العقد المعماري لمستودع بيانات الحضور والانصراف (Attendance Repository Interface)
abstract interface class AttendanceRepository implements BaseRepository {
  // Check-in / Check-out
  Future<Result<AttendanceRecord>> checkIn(CheckInParams params);
  Future<Result<AttendanceRecord>> checkOut(CheckOutParams params);

  // Today Status
  Future<Result<TodayStatus>> getTodayStatus({required String userId});

  // Records
  Future<Result<List<AttendanceRecord>>> getRecords({
    String? userId,
    String? month,
    String? date,
    int? limit,
  });
  Future<Result<AttendanceRecord>> getRecordById({required String recordId});

  // Config & Shifts
  Future<Result<List<Shift>>> getShifts();
  Future<Result<Shift>> addShift(Shift shift);
  Future<Result<Shift>> updateShift(Shift shift);
  Future<Result<void>> deleteShift(String shiftId);
  Future<Result<List<SiteGeofence>>> getSites();
  Future<Result<AttendanceSettings>> getSettings();

  // Audit Logs
  Future<Result<List<AuditLogEntry>>> getAuditLogs({String? recordId});

  // Corrections
  Future<Result<CorrectionRequest>> requestCorrection(
    RequestCorrectionParams params,
  );
  Future<Result<List<CorrectionRequest>>> getCorrections({String? userId});
  Future<Result<void>> approveCorrection(ApproveCorrectionParams params);
  Future<Result<void>> rejectCorrection(RejectCorrectionParams params);

  // Overtime
  Future<Result<List<OvertimeRecord>>> getOvertime({String? userId});
  Future<Result<OvertimeRecord>> addOvertime(AddOvertimeParams params);
  Future<Result<void>> approveOvertime(ApproveOvertimeParams params);
  Future<Result<void>> rejectOvertime(RejectOvertimeParams params);

  // Leaves
  Future<Result<List<LeaveRequest>>> getLeaves({String? userId});
  Future<Result<LeaveRequest>> submitLeave(SubmitLeaveParams params);
  Future<Result<void>> approveLeave(ApproveLeaveParams params);
  Future<Result<void>> rejectLeave(RejectLeaveParams params);

  // Deductions
  Future<Result<List<Deduction>>> getDeductions({String? userId});
  Future<Result<Deduction>> addDeduction(AddDeductionParams params);

  // Notifications
  Future<Result<List<AppNotification>>> getNotifications({
    String? userId,
    bool unreadOnly = false,
  });
  Future<Result<void>> markNotificationRead({required String notificationId});

  // Sync
  Future<Result<void>> syncPendingOperations();
  Future<int> getPendingOperationsCount();
}
