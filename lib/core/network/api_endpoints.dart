class ApiEndpoints {
  ApiEndpoints._();

  // Google Apps Script Web App Base URL for Al-Fateh Management System
  // Can be overridden via --dart-define=API_BASE_URL=... for production deployments
  static const String defaultBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://script.google.com/macros/s/AKfycbwW7Ii78ftHFew0g2wxCfyWVaiax3VI9g2NtgMFdd8uocI2GaBWcnm1PhQov7Q4-nY4/exec',
  );

  // General & Ping
  static const String actionPing = 'ping';
  static const String actionInit = 'init';

  // Tickets & Follow-ups
  static const String actionGetAll = 'getAll';
  static const String actionAdd = 'add';
  static const String actionUpdate = 'update';
  static const String actionAddProblem = 'addProblem';

  // Auth & RBAC
  static const String actionLogin = 'login';
  static const String actionGetEffectivePerms = 'perms.getEffective';

  // Attendance & Geofencing
  static const String actionAttendanceCheckIn = 'attendance.checkIn';
  static const String actionAttendanceCheckOut = 'attendance.checkOut';
  static const String actionAttendanceTodayStatus = 'attendance.getTodayStatus';
  static const String actionAttendanceRecords = 'attendance.getRecords';

  // Shifts, Sites & Config
  static const String actionShiftsGetAll = 'shifts.getAll';
  static const String actionShiftsAdd = 'shifts.add';
  static const String actionShiftsUpdate = 'shifts.update';
  static const String actionShiftsDelete = 'shifts.delete';
  static const String actionSitesGetAll = 'sites.getAll';
  static const String actionSystemGetConfig = 'system.getConfig';
  static const String actionAuditLogs = 'audit.getLogs';

  // Corrections
  static const String actionCorrectionsRequest = 'corrections.request';
  static const String actionCorrectionsGetAll = 'corrections.getAll';
  static const String actionCorrectionsApprove = 'corrections.approve';

  // Overtime
  static const String actionOvertimeGetAll = 'overtime.getAll';
  static const String actionOvertimeAdd = 'overtime.add';
  static const String actionOvertimeReview = 'overtime.review';

  // Leaves
  static const String actionLeavesGetAll = 'leaves.getAll';
  static const String actionLeavesSubmit = 'leaves.submit';
  static const String actionLeavesReview = 'leaves.review';

  // Deductions
  static const String actionDeductionsGetAll = 'deductions.getAll';
  static const String actionDeductionsAdd = 'deductions.add';

  // Notifications
  static const String actionNotificationsGet = 'notifications.get';
  static const String actionNotificationsMarkRead = 'notifications.markRead';
}
