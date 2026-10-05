import 'package:flutter/material.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../../../core/services/services.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../features/auth/domain/models/user_model.dart';
import '../../app_hover.dart';
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
    final allItems = RoleDefinitions.getItemsForRoleCode(user?.roleId);
    final items = allItems.take(5).toList();

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
        child: Container(
          height: AppDimens.bottomNavBarHeight - 4,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: isDark
                ? colors.surfaceContainerHigh.withValues(alpha: 0.95)
                : colors.surface.withValues(alpha: 0.96),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: colors.outlineVariant
                  .withValues(alpha: isDark ? 0.25 : 0.35),
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
                child: AppHover.scale(
                  scale: 1.04,
                  child: InkWell(
                    onTap: () {
                      if (!isSelected) {
                        if (onDestinationSelected != null) {
                          onDestinationSelected!(item.route);
                        } else {
                          AppNavigationService.instance
                              .goTo(context, item.route);
                        }
                      }
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOutCubic,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? colors.primaryContainer.withValues(alpha: 0.5)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isSelected
                                ? (item.activeIcon ?? item.icon)
                                : item.icon,
                            size: 22,
                            color: isSelected
                                ? colors.primary
                                : colors.onSurfaceVariant,
                          ),
                          const SizedBox(height: 2),
                          Flexible(
                            child: AppText.caption(
                              context.tr(item.titleKey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected
                                  ? colors.primary
                                  : colors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
