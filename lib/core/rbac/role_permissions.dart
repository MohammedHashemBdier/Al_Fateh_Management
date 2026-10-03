/// مصفوفة الأدوار ونظام الصلاحيات الشامل (Role-Based Access Control)
enum UserRole {
  admin('ROLE_ADMIN', 'أدمن النظام', 'System Administrator', 1),
  generalManager('ROLE_GM', 'المدير العام', 'General Manager', 1),
  finance('ROLE_FINANCE', 'المالية والمحاسبة', 'Finance & Accounting', 2),
  supportManager('ROLE_SUPPORT_MANAGER', 'مدير الدعم الفني', 'Support Manager', 2),
  salesManager('ROLE_SALES_MANAGER', 'مدير المبيعات', 'Sales Manager', 2),
  support('ROLE_SUPPORT', 'فني الدعم الفني', 'Technical Support', 3),
  sales('ROLE_SALES', 'موظف المبيعات', 'Sales Representative', 3);

  final String code;
  final String titleAr;
  final String titleEn;
  final int hierarchyLevel;

  const UserRole(this.code, this.titleAr, this.titleEn, this.hierarchyLevel);

  static UserRole fromCode(String? code) {
    if (code == null) return UserRole.support;
    final normalized = code.trim().toUpperCase();
    for (final role in UserRole.values) {
      if (role.code == normalized) return role;
    }
    return UserRole.support;
  }

  bool get isAdmin => this == UserRole.admin;
  bool get isGeneralManager => this == UserRole.generalManager;
  bool get isExecutive => hierarchyLevel == 1;
  bool get isDepartmentManager => hierarchyLevel <= 2;
  bool get isFinance => this == UserRole.finance;
  bool get isSupport => this == UserRole.support || this == UserRole.supportManager;
  bool get isSales => this == UserRole.sales || this == UserRole.salesManager;

  /// هل يملك صلاحية إدارة المستخدمين وتعديل الصلاحيات
  bool get canManageUsers => this == UserRole.admin;

  /// هل يملك صلاحية مشاهدة الرواتب والمالية
  bool get canViewPayroll => this == UserRole.finance || this == UserRole.generalManager || this == UserRole.admin;

  /// هل يملك صلاحية اعتماد الحذف وتصحيح الدوام
  bool get canApproveRequests => hierarchyLevel <= 2;

  /// هل يملك صلاحية الوصول لسجل التدقيق Audit Logs
  bool get canViewAuditLogs => this == UserRole.admin || this == UserRole.generalManager;
}

/// نطاق البيانات المصرح بالوصول إليها (Permission Scope)
enum PermissionScope {
  self('SELF', 'بيانات الموظف فقط'),
  team('TEAM', 'بيانات الفريق المباشر'),
  department('DEPARTMENT', 'بيانات القسم بالكامل'),
  all('ALL', 'كافة بيانات المنظومة');

  final String code;
  final String descriptionAr;

  const PermissionScope(this.code, this.descriptionAr);

  static PermissionScope fromCode(String? code) {
    if (code == null) return PermissionScope.self;
    final normalized = code.trim().toUpperCase();
    for (final scope in PermissionScope.values) {
      if (scope.code == normalized) return scope;
    }
    return PermissionScope.self;
  }
}

/// قاموس الصلاحيات الرسمي في منظومة الفتح
class AppPermissions {
  AppPermissions._();

  // Attendance
  static const String attendanceCheckin = 'attendance.checkin';
  static const String attendanceView = 'attendance.view';
  static const String attendanceCorrectionReq = 'attendance.correction.req';
  static const String attendanceCorrectionApprove = 'attendance.correction.approve';

  // Tickets
  static const String ticketsCreate = 'tickets.create';
  static const String ticketsView = 'tickets.view';
  static const String ticketsUpdate = 'tickets.update';
  static const String ticketsDeleteReq = 'tickets.delete.req';
  static const String ticketsDeleteApprove = 'tickets.delete.approve';

  // Payroll & Finance
  static const String payrollView = 'payroll.view';
  static const String payrollManage = 'payroll.manage';
  static const String payrollLock = 'payroll.lock';

  // Management & Users
  static const String rolesManage = 'roles.manage';
  static const String usersManage = 'users.manage';
  static const String auditView = 'audit.view';

  /// فحص امتلاك الدور لصلاحية معينة
  static bool hasPermission(UserRole role, String permissionCode) {
    if (role == UserRole.admin || role == UserRole.generalManager) return true;

    switch (permissionCode) {
      case attendanceCheckin:
      case attendanceView:
      case attendanceCorrectionReq:
        return true; // متاح للجميع
      case attendanceCorrectionApprove:
        return role.isDepartmentManager || role.isFinance;
      case ticketsCreate:
      case ticketsView:
      case ticketsUpdate:
        return true;
      case ticketsDeleteReq:
        return true;
      case ticketsDeleteApprove:
        return role.isDepartmentManager;
      case payrollView:
      case payrollManage:
      case payrollLock:
        return role.canViewPayroll;
      case rolesManage:
      case usersManage:
      case auditView:
        return role.canManageUsers || role.canViewAuditLogs;
      default:
        return false;
    }
  }

  /// استخراج النطاق الافتراضي للدور
  static PermissionScope getDefaultScope(UserRole role) {
    if (role == UserRole.admin || role == UserRole.generalManager || role == UserRole.finance) {
      return PermissionScope.all;
    }
    if (role.isDepartmentManager) {
      return PermissionScope.department;
    }
    return PermissionScope.self;
  }
}
