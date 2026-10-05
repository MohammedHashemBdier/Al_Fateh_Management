import '../../../../core/rbac/role_permissions.dart';
import 'app_nav_item.dart';

/// ملف تعريف مصفوفة عناصر التنقل حسب أدوار وصلاحيات المستخدمين (RBAC Role Definitions)
class RoleDefinitions {
  const RoleDefinitions._();

  static const Map<UserRole, List<AppNavItem>> roleNavItems = {
    UserRole.admin: [
      AppNavItem.home,
      AppNavItem.tickets,
      AppNavItem.attendance,
      AppNavItem.employees,
      AppNavItem.settings,
    ],
    UserRole.generalManager: [
      AppNavItem.home,
      AppNavItem.tickets,
      AppNavItem.attendance,
      AppNavItem.employees,
      AppNavItem.settings,
    ],
    UserRole.finance: [
      AppNavItem.home,
      AppNavItem.attendance,
      AppNavItem.employees,
      AppNavItem.settings,
    ],
    UserRole.supportManager: [
      AppNavItem.home,
      AppNavItem.tickets,
      AppNavItem.attendance,
      AppNavItem.settings,
    ],
    UserRole.support: [
      AppNavItem.home,
      AppNavItem.tickets,
      AppNavItem.attendance,
      AppNavItem.settings,
    ],
    UserRole.salesManager: [
      AppNavItem.home,
      AppNavItem.tickets,
      AppNavItem.attendance,
      AppNavItem.settings,
    ],
    UserRole.sales: [
      AppNavItem.home,
      AppNavItem.tickets,
      AppNavItem.attendance,
      AppNavItem.settings,
    ],
  };

  /// استرجاع عناصر التنقل المصرح بها لدور المستخدم
  static List<AppNavItem> getItemsForRole(UserRole role) {
    return roleNavItems[role] ?? [AppNavItem.home, AppNavItem.settings];
  }

  /// استرجاع عناصر التنقل بواسطة كود الدور
  static List<AppNavItem> getItemsForRoleCode(String? roleCode) {
    final role = UserRole.fromCode(roleCode);
    return getItemsForRole(role);
  }

  /// استرجاع المسار التالي بناءً على المسار الحالي ودور المستخدم
  static String? getNextRoute(String currentRoute, String? roleCode) {
    final cleanRoute = currentRoute.split('?').first;
    final items = getItemsForRoleCode(roleCode);
    final idx = items.indexWhere((it) => it.route == cleanRoute);
    if (idx != -1 && idx + 1 < items.length) {
      return items[idx + 1].route;
    }
    return null;
  }

  /// استرجاع المسار السابق بناءً على المسار الحالي ودور المستخدم
  static String? getPreviousRoute(String currentRoute, String? roleCode) {
    final cleanRoute = currentRoute.split('?').first;
    final items = getItemsForRoleCode(roleCode);
    final idx = items.indexWhere((it) => it.route == cleanRoute);
    if (idx > 0) {
      return items[idx - 1].route;
    }
    return null;
  }
}
