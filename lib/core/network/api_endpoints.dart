class ApiEndpoints {
  ApiEndpoints._();

  // Google Apps Script Web App Base URL for Al-Fateh Management System
  // Can be overridden via --dart-define=API_BASE_URL=... for production deployments
  static const String defaultBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://script.google.com/macros/s/AKfycbwW7Ii78ftHFew0g2wxCfyWVaiax3VI9g2NtgMFdd8uocI2GaBWcnm1PhQov7Q4-nY4/exec',
  );

  // Tickets & Follow-ups
  static const String actionInit = 'init';
  static const String actionGetAll = 'getAll';
  static const String actionAdd = 'add';
  static const String actionUpdate = 'update';
  static const String actionAddProblem = 'addProblem';

  // Auth & RBAC
  static const String actionLogin = 'login';
  static const String actionGetEffectivePerms = 'perms.getEffective';

  // Attendance & Geofencing
  static const String actionAttendanceCheckIn = 'attendance.checkIn';
  static const String actionAttendanceRecords = 'attendance.getRecords';
}
