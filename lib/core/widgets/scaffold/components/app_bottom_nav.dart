import 'package:flutter/material.dart';

import '../../../../core/services/services.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../../../features/auth/domain/models/user_model.dart';
import '../../app_text.dart';
import '../models/role_definitions.dart';

/// شريط التنقل السفلي الموحد للأجهزة المحمولة بتصميم الجزيرة العائمة (Unified Mobile Bottom Nav)
class AppBottomNav extends StatelessWidget {
  final UserModel? user;
  final String activeRoute;
  final ValueChanged<String>? onDestinationSelected;

  const AppBottomNav({
    super.key,
    this.user,
    required this.activeRoute,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = context.isDark;
    final effectiveUser = user ?? AuthLocalDataSourceImpl.currentUser;
    final allItems = RoleDefinitions.getItemsForRoleCode(effectiveUser?.roleId);
    final items = allItems.take(5).toList();

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: isDark
                ? colors.surfaceContainerHigh.withValues(alpha: 0.95)
                : colors.surface.withValues(alpha: 0.96),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: colors.outlineVariant.withValues(
                alpha: isDark ? 0.25 : 0.35,
              ),
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: colors.shadow.withValues(alpha: isDark ? 0.35 : 0.08),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((item) {
              final isSelected = activeRoute == item.route;

              return Expanded(
                child: _AppBottomNavItem(
                  titleKey: item.titleKey,
                  icon: item.icon,
                  activeIcon: item.activeIcon ?? item.icon,
                  isSelected: isSelected,
                  onTap: () {
                    if (!isSelected) {
                      if (onDestinationSelected != null) {
                        onDestinationSelected!(item.route);
                      } else {
                        AppNavigationService.instance.goTo(context, item.route);
                      }
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _AppBottomNavItem extends StatefulWidget {
  final String titleKey;
  final IconData icon;
  final IconData activeIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const _AppBottomNavItem({
    required this.titleKey,
    required this.icon,
    required this.activeIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_AppBottomNavItem> createState() => _AppBottomNavItemState();
}

class _AppBottomNavItemState extends State<_AppBottomNavItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isSelected = widget.isSelected;

    return Semantics(
      button: true,
      selected: isSelected,
      label: context.tr(widget.titleKey),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 140),
          scale: _isPressed ? 0.92 : 1.0,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected
                    ? colors.primary.withValues(alpha: 0.14)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                      ? colors.primary.withValues(alpha: 0.3)
                      : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedScale(
                    duration: const Duration(milliseconds: 180),
                    scale: isSelected ? 1.12 : 1.0,
                    child: Icon(
                      isSelected ? widget.activeIcon : widget.icon,
                      size: 21,
                      color: isSelected
                          ? colors.primary
                          : colors.onSurfaceVariant.withValues(alpha: 0.75),
                    ),
                  ),
                  const SizedBox(height: 2),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AppText.caption(
                      widget.titleKey,
                      maxLines: 1,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w500,
                      fontSize: 10.5,
                      color: isSelected
                          ? colors.primary
                          : colors.onSurfaceVariant.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
