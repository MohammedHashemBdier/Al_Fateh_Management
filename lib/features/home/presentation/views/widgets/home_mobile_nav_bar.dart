import 'package:flutter/material.dart';
import 'package:al_fateh_management/core/rbac/role_permissions.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/core/widgets/widgets.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:al_fateh_management/features/home/domain/models/nav_destination_item.dart';

/// شريط تنقل سفلي عائم بتصميم جزيرة عصرية عازلة للأخطاء وأنيميشن لمس انسيابي (Floating Island Nav Bar)
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
    final isDark = context.isDark;
    final role = UserRole.fromCode(user.roleId);
    final destinations = NavDestinationItem.getDestinations(role);
    final currentIndex = selectedIndex.clamp(0, destinations.length - 1);

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
            children: destinations.asMap().entries.map((entry) {
              final index = entry.key;
              final dest = entry.value;
              final isSelected = currentIndex == index;

              return Expanded(
                child: _NavBarItem(
                  destination: dest,
                  isSelected: isSelected,
                  onTap: () => onDestinationSelected(index),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final NavDestinationItem destination;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.destination,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isSelected = widget.isSelected;
    final dest = widget.destination;

    return Semantics(
      button: true,
      selected: isSelected,
      label: context.tr(dest.titleKey),
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
                  // الأيقونة مع أنيميشن التكبير واللون
                  AnimatedScale(
                    duration: const Duration(milliseconds: 180),
                    scale: isSelected ? 1.12 : 1.0,
                    child: Icon(
                      isSelected ? dest.selectedIcon : dest.icon,
                      size: 21,
                      color: isSelected
                          ? colors.primary
                          : colors.onSurfaceVariant.withValues(alpha: 0.75),
                    ),
                  ),
                  const SizedBox(height: 2),

                  // نص الوجهة مع ملاءمة تلقائية (FittedBox) تمنع أي Overflow
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AppText.caption(
                      dest.titleKey,
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
