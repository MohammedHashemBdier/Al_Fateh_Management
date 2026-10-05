import 'package:flutter/material.dart';

import '../../../../core/design_system/app_curves.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../../../core/design_system/app_durations.dart';
import '../../../../core/design_system/app_radii.dart';
import '../../../../core/rbac/role_permissions.dart';
import '../../../../core/services/services.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../../../features/auth/domain/models/user_model.dart';
import '../../app_button.dart';
import '../../app_card.dart';
import '../../app_hover.dart';
import '../../app_text.dart';
import '../../app_tooltip.dart';
import '../models/role_definitions.dart';

/// الشريط الجانبي التكيفي الموحد لبيئة سطح المكتب والويب (Unified Desktop Sidebar / Rail)
class AppNavigationSidebar extends StatelessWidget {
  final UserModel? user;
  final bool isExpanded;
  final String activeRoute;
  final VoidCallback onToggle;
  final ValueChanged<String>? onDestinationSelected;
  final VoidCallback? onLogout;

  const AppNavigationSidebar({
    super.key,
    this.user,
    required this.isExpanded,
    required this.activeRoute,
    required this.onToggle,
    this.onDestinationSelected,
    this.onLogout,
  });

  Future<void> _handleLogout(BuildContext context) async {
    final confirmed = await AppDialogService.danger(
      context: context,
      title: context.tr('confirm_logout_title'),
      message: context.tr('confirm_logout_message'),
      confirmText: context.tr('logout'),
      cancelText: context.tr('cancel'),
    );

    if (confirmed) {
      if (onLogout != null) {
        onLogout!();
      } else {
        await AuthRepositoryImpl().logout();
        if (context.mounted) {
          AppNavigationService.instance.replaceWith(context, '/login');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isArabic = context.isArabic;
    final navItems = RoleDefinitions.getItemsForRoleCode(user?.roleId);
    final role = UserRole.fromCode(user?.roleId);
    final width = isExpanded
        ? AppDimens.navRailExpandedWidth
        : AppDimens.navRailWidth;

    return AnimatedContainer(
      duration: AppDurations.medium,
      curve: AppCurves.standard,
      width: width,
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        border: Border(
          right: isArabic
              ? BorderSide.none
              : BorderSide(
                  color: colors.outlineVariant.withValues(alpha: 0.25),
                  width: 1,
                ),
          left: isArabic
              ? BorderSide(
                  color: colors.outlineVariant.withValues(alpha: 0.25),
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      child: ClipRect(
        child: SizedBox(
          width: width,
          child: SafeArea(
            child: Column(
              children: [
                // ترويسة الشعار والطي
                Container(
                  height: AppDimens.appBarHeight,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.paddingSmall,
                  ),
                  child: Row(
                    mainAxisAlignment: isExpanded
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      if (isExpanded) ...[
                        const SizedBox(width: AppDimens.space4),
                        Icon(
                          Icons.router_rounded,
                          color: colors.primary,
                          size: AppDimens.iconLarge,
                        ),
                        const SizedBox(width: AppDimens.spacingSmall),
                        Expanded(
                          child: AppText.title(
                            context.tr('app_name'),
                            fontWeight: FontWeight.bold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                      AppIconButton(
                        icon: isExpanded
                            ? Icons.menu_open_rounded
                            : Icons.menu_rounded,
                        tooltip: context.tr('toggle_sidebar'),
                        onPressed: onToggle,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),

                // كرت المستخدم
                if (user != null) ...[
                  if (isExpanded)
                    Padding(
                      padding: const EdgeInsets.all(AppDimens.paddingSmall),
                      child: AppCard(
                        padding: const EdgeInsets.all(AppDimens.paddingSmall),
                        backgroundColor: colors.surfaceContainerHighest
                            .withValues(alpha: 0.35),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: AppDimens.avatarSm / 2 + 4,
                              backgroundColor: colors.primary,
                              child: AppText.body(
                                user!.fullName.isNotEmpty
                                    ? user!.fullName[0]
                                    : 'U',
                                color: colors.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: AppDimens.spacingSmall),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText.label(
                                    user!.fullName,
                                    fontWeight: FontWeight.bold,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  AppText.caption(
                                    context.tr(role.code.toLowerCase()),
                                    color: colors.primary,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: AppTooltip(
                        message: user!.fullName,
                        child: CircleAvatar(
                          radius: AppDimens.avatarSm / 2 + 2,
                          backgroundColor: colors.primary,
                          child: AppText.body(
                            user!.fullName.isNotEmpty ? user!.fullName[0] : 'U',
                            color: colors.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],

                const SizedBox(height: AppDimens.space6),

                // قائمة وجهات التنقل
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.paddingSmall,
                      vertical: AppDimens.space4,
                    ),
                    itemCount: navItems.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 4),
                    itemBuilder: (context, index) {
                      final item = navItems[index];
                      final isSelected = activeRoute == item.route;
                      final label = context.tr(item.titleKey);

                      final navTile = Material(
                        color: Colors.transparent,
                        borderRadius: AppRadii.sm,
                        child: InkWell(
                          onTap: () {
                            if (!isSelected) {
                              if (onDestinationSelected != null) {
                                onDestinationSelected!(item.route);
                              } else {
                                AppNavigationService.instance.goTo(
                                  context,
                                  item.route,
                                );
                              }
                            }
                          },
                          borderRadius: AppRadii.sm,
                          child: Container(
                            height: 44,
                            padding: EdgeInsets.symmetric(
                              horizontal: isExpanded ? 12 : 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? colors.primaryContainer.withValues(
                                      alpha: 0.45,
                                    )
                                  : null,
                              borderRadius: AppRadii.sm,
                            ),
                            child: Row(
                              mainAxisAlignment: isExpanded
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isSelected
                                      ? (item.activeIcon ?? item.icon)
                                      : item.icon,
                                  color: isSelected
                                      ? colors.primary
                                      : colors.onSurfaceVariant,
                                  size: AppDimens.iconMedium,
                                ),
                                if (isExpanded) ...[
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: AppText.body(
                                      label,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: isSelected
                                          ? colors.primary
                                          : colors.onSurface,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      );

                      return AppHover.scale(
                        scale: 1.01,
                        child: isExpanded
                            ? navTile
                            : AppTooltip(message: label, child: navTile),
                      );
                    },
                  ),
                ),

                const Divider(height: 1),

                // زر الخروج السفلي
                Padding(
                  padding: const EdgeInsets.all(AppDimens.paddingSmall),
                  child: isExpanded
                      ? AppButton(
                          label: context.tr('logout'),
                          variant: AppButtonVariant.ghost,
                          icon: Icons.logout_rounded,
                          height: AppDimens.buttonHeightSm,
                          onPressed: () => _handleLogout(context),
                        )
                      : AppTooltip(
                          message: context.tr('logout'),
                          child: AppIconButton(
                            icon: Icons.logout_rounded,
                            color: colors.error,
                            onPressed: () => _handleLogout(context),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
