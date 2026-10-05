import 'package:flutter/material.dart';
import '../../../../core/rbac/role_permissions.dart';

/// نموذج عنصر التنقل الموحد في منظومة الفتح (Unified Navigation Item)
class AppNavItem {
  final int id;
  final String route;
  final String titleKey;
  final IconData icon;
  final IconData? activeIcon;
  final int badgeCount;
  final List<UserRole>? requiredRoles;
  final List<String> requiredPermissions;

  const AppNavItem({
    required this.id,
    required this.route,
    required this.titleKey,
    required this.icon,
    this.activeIcon,
    this.badgeCount = 0,
    this.requiredRoles,
    this.requiredPermissions = const [],
  });

  static const home = AppNavItem(
    id: 0,
    route: '/home',
    titleKey: 'nav_home',
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard_rounded,
  );

  static const tickets = AppNavItem(
    id: 1,
    route: '/tickets',
    titleKey: 'nav_tickets',
    icon: Icons.confirmation_number_outlined,
    activeIcon: Icons.confirmation_number_rounded,
    requiredPermissions: ['tickets.view'],
  );

  static const attendance = AppNavItem(
    id: 2,
    route: '/attendance',
    titleKey: 'nav_attendance',
    icon: Icons.timer_outlined,
    activeIcon: Icons.timer_rounded,
    requiredPermissions: ['attendance.view'],
  );

  static const employees = AppNavItem(
    id: 3,
    route: '/employees',
    titleKey: 'nav_employees',
    icon: Icons.people_outline_rounded,
    activeIcon: Icons.people_rounded,
    requiredRoles: [
      UserRole.admin,
      UserRole.generalManager,
      UserRole.supportManager,
      UserRole.salesManager,
      UserRole.finance,
    ],
    requiredPermissions: ['users.manage'],
  );

  static const settings = AppNavItem(
    id: 4,
    route: '/settings',
    titleKey: 'nav_settings',
    icon: Icons.settings_outlined,
    activeIcon: Icons.settings_rounded,
  );

  static const List<AppNavItem> defaultItems = [
    home,
    tickets,
    attendance,
    employees,
    settings,
  ];
}
