export '../../domain/models/app_notification.dart';
export '../../domain/models/attendance_record.dart';
export '../../domain/models/attendance_settings.dart';
export '../../domain/models/correction_request.dart';
export '../../domain/models/deduction.dart';
export '../../domain/models/leave_request.dart';
export '../../domain/models/overtime_record.dart';
export '../../domain/models/shift.dart';
export '../../domain/models/site_geofence.dart';
export '../../domain/models/today_status.dart';
export '../../domain/models/audit_log_entry.dart';
export 'pending_operation.dart';

import '../../domain/models/app_notification.dart';
import '../../domain/models/attendance_record.dart';
import '../../domain/models/attendance_settings.dart';
import '../../domain/models/audit_log_entry.dart';
import '../../domain/models/correction_request.dart';
import '../../domain/models/deduction.dart';
import '../../domain/models/leave_request.dart';
import '../../domain/models/overtime_record.dart';
import '../../domain/models/shift.dart';
import '../../domain/models/site_geofence.dart';
import '../../domain/models/today_status.dart';

// Typedefs للكيانات كـ Data Models (DTOs) مباشرة لتجنب تكرار الحقول المزدوج
typedef AttendanceRecordModel = AttendanceRecord;
typedef ShiftModel = Shift;
typedef SiteGeofenceModel = SiteGeofence;
typedef AttendanceSettingsModel = AttendanceSettings;
typedef TodayStatusModel = TodayStatus;
typedef CorrectionRequestModel = CorrectionRequest;
typedef OvertimeRecordModel = OvertimeRecord;
typedef DeductionModel = Deduction;
typedef LeaveRequestModel = LeaveRequest;
typedef AppNotificationModel = AppNotification;
typedef AuditLogEntryModel = AuditLogEntry;
