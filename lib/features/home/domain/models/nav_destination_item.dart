import 'package:flutter/material.dart';

import '../../../../core/rbac/role_permissions.dart';

/// كائن يمثل وجهة تصفح في المنظومة مع الصلاحيات والأيقونات
class NavDestinationItem {
  final int id;
  final String titleKey;
  final IconData icon;
  final IconData selectedIcon;
  final String route;
  final List<UserRole>? requiredRoles;
  final int badgeCount;

  const NavDestinationItem({
    required this.id,
    required this.titleKey,
    required this.icon,
    required this.selectedIcon,
    required this.route,
    this.requiredRoles,
    this.badgeCount = 0,
  });

  /// قائمة الوجهات الرئيسية المعتمدة في منظومة الفتح
  static List<NavDestinationItem> getDestinations(UserRole userRole) {
    final all = [
      const NavDestinationItem(
        id: 0,
        titleKey: 'nav_home',
        icon: Icons.dashboard_outlined,
        selectedIcon: Icons.dashboard_rounded,
        route: '/home',
      ),
      const NavDestinationItem(
        id: 1,
        titleKey: 'nav_tickets',
        icon: Icons.support_agent_outlined,
        selectedIcon: Icons.support_agent_rounded,
        route: '/tickets',
      ),
      const NavDestinationItem(
        id: 2,
        titleKey: 'nav_attendance',
        icon: Icons.access_time_outlined,
        selectedIcon: Icons.access_time_filled_rounded,
        route: '/attendance',
      ),
      NavDestinationItem(
        id: 3,
        titleKey: 'nav_employees',
        icon: Icons.badge_outlined,
        selectedIcon: Icons.badge_rounded,
        route: '/employees',
        requiredRoles: const [
          UserRole.admin,
          UserRole.generalManager,
          UserRole.supportManager,
          UserRole.salesManager,
          UserRole.finance,
        ],
      ),
      const NavDestinationItem(
        id: 4,
        titleKey: 'nav_settings',
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings_rounded,
        route: '/settings',
      ),
    ];

    // فلترة الوجهات بناءً على دور المستخدم
    return all.where((dest) {
      if (dest.requiredRoles == null) return true;
      return dest.requiredRoles!.contains(userRole) ||
          userRole == UserRole.admin;
    }).toList();
  }
}
