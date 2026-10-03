import 'package:flutter/material.dart';
import '../rbac/role_permissions.dart';

/// ويدجت بوابة الأدوار (RoleGate) لإظهار أو إخفاء العناصر البرمجية بحسب دور المستخدم
class RoleGate extends StatelessWidget {
  final UserRole userRole;
  final List<UserRole> allowedRoles;
  final Widget child;
  final Widget? fallback;

  const RoleGate({
    super.key,
    required this.userRole,
    required this.allowedRoles,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    if (allowedRoles.contains(userRole) || userRole == UserRole.admin) {
      return child;
    }
    return fallback ?? const SizedBox.shrink();
  }
}

/// ويدجت بوابة الصلاحيات (PermissionGate) للتحقق من كود صلاحية محدد
class PermissionGate extends StatelessWidget {
  final UserRole userRole;
  final String permissionCode;
  final Widget child;
  final Widget? fallback;

  const PermissionGate({
    super.key,
    required this.userRole,
    required this.permissionCode,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    if (AppPermissions.hasPermission(userRole, permissionCode)) {
      return child;
    }
    return fallback ?? const SizedBox.shrink();
  }
}

/// ويدجت بوابة النطاق (ScopeGate) للتحقق من نطاق البيانات (SELF, TEAM, DEPARTMENT, ALL)
class ScopeGate extends StatelessWidget {
  final UserRole userRole;
  final PermissionScope minimumScope;
  final Widget child;
  final Widget? fallback;

  const ScopeGate({
    super.key,
    required this.userRole,
    required this.minimumScope,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    final currentScope = AppPermissions.getDefaultScope(userRole);
    // إذا كان النطاق الحالي يساوي أو يتفوق على النطاق الأدنى
    if (_isScopeAllowed(currentScope, minimumScope)) {
      return child;
    }
    return fallback ?? const SizedBox.shrink();
  }

  bool _isScopeAllowed(PermissionScope current, PermissionScope required) {
    if (current == PermissionScope.all) return true;
    if (current == PermissionScope.department) {
      return required != PermissionScope.all;
    }
    if (current == PermissionScope.team) {
      return required == PermissionScope.team || required == PermissionScope.self;
    }
    return required == PermissionScope.self;
  }
}
