import 'package:flutter/material.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../../../core/design_system/app_radii.dart';
import '../../../../core/rbac/role_permissions.dart';
import '../../../../core/services/services.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../../../features/auth/domain/models/user_model.dart';
import '../../app_button.dart';
import '../../app_card.dart';
import '../../app_text.dart';
import '../../locale_toggle_button.dart';
import '../../theme_toggle_button.dart';
import '../models/role_definitions.dart';

/// القائمة الجانبية الموحدة للأجهزة المحمولة واللوحية (Unified Responsive Drawer)
class AppDrawer extends StatelessWidget {
  final UserModel? user;
  final String activeRoute;
  final ValueChanged<String>? onDestinationSelected;
  final VoidCallback? onLogout;

  const AppDrawer({
    super.key,
    this.user,
    required this.activeRoute,
    this.onDestinationSelected,
    this.onLogout,
  });

  Future<void> _handleLogout(BuildContext context) async {
    Navigator.of(context).pop();
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
    final navItems = RoleDefinitions.getItemsForRoleCode(user?.roleId);
    final role = UserRole.fromCode(user?.roleId);

    return Drawer(
      backgroundColor: colors.surface,
      surfaceTintColor: colors.surfaceTint,
      child: SafeArea(
        child: Column(
          children: [
            // ترويسة المستخدم
            AppCard(
              padding: const EdgeInsets.all(AppDimens.paddingMedium),
              backgroundColor: colors.surfaceContainerLow,
              borderRadius: 0,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: AppDimens.avatarSm,
                    backgroundColor: colors.primary,
                    child: AppText.title(
                      user?.fullName.isNotEmpty == true
                          ? user!.fullName[0]
                          : 'U',
                      color: colors.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingMedium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText.title(
                          user?.fullName ?? context.tr('app_name'),
                          fontWeight: FontWeight.bold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
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
            const SizedBox(height: AppDimens.spacingSmall),

            // قائمة وجهات التنقل
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.paddingSmall,
                  vertical: AppDimens.paddingSmall,
                ),
                itemCount: navItems.length,
                separatorBuilder: (_, _) => const SizedBox(height: 4),
                itemBuilder: (context, index) {
                  final item = navItems[index];
                  final isSelected = activeRoute == item.route;

                  return Material(
                    color: Colors.transparent,
                    child: ListTile(
                      dense: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppRadii.sm,
                      ),
                      tileColor: isSelected
                          ? colors.primaryContainer.withValues(alpha: 0.45)
                          : null,
                      leading: Icon(
                        isSelected ? (item.activeIcon ?? item.icon) : item.icon,
                        color:
                            isSelected ? colors.primary : colors.onSurfaceVariant,
                        size: AppDimens.iconMedium,
                      ),
                      title: AppText.body(
                        context.tr(item.titleKey),
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? colors.primary : colors.onSurface,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
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
                },
              ),
            ),

            const Divider(height: 1),

            // شريط الأدوات السفلي
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingMedium,
                vertical: AppDimens.paddingSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ThemeToggleButton(),
                  const LocaleToggleButton(),
                  AppButton(
                    label: context.tr('logout'),
                    variant: AppButtonVariant.danger,
                    height: AppDimens.buttonHeightSm,
                    icon: Icons.logout_rounded,
                    onPressed: () => _handleLogout(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
