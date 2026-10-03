import 'package:flutter/material.dart';
import 'package:al_fateh_management/core/rbac/role_permissions.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:al_fateh_management/features/home/domain/models/nav_destination_item.dart';

/// شريط التنقل السفلي المتجاوب مع شاشات الموبايل (Bottom Navigation Bar)
class HomeMobileNavBar extends StatelessWidget {
  final UserModel user;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const HomeMobileNavBar({
    super.key,
    required this.user,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final role = UserRole.fromCode(user.roleId);
    final destinations = NavDestinationItem.getDestinations(role);

    return NavigationBar(
      selectedIndex: selectedIndex.clamp(0, destinations.length - 1),
      onDestinationSelected: onDestinationSelected,
      backgroundColor: colors.surfaceContainer,
      elevation: 3,
      indicatorColor: colors.primaryContainer,
      destinations: destinations.map((dest) {
        return NavigationDestination(
          icon: Icon(dest.icon, color: colors.onSurfaceVariant),
          selectedIcon: Icon(dest.selectedIcon, color: colors.onPrimaryContainer),
          label: context.tr(dest.titleKey),
          tooltip: context.tr(dest.titleKey),
        );
      }).toList(),
    );
  }
}
