import 'package:flutter/material.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/rbac/role_permissions.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/core/widgets/app_confirm_dialog.dart';
import 'package:al_fateh_management/core/widgets/app_hover.dart';
import 'package:al_fateh_management/core/widgets/app_logo.dart';
import 'package:al_fateh_management/core/widgets/app_tooltip.dart';
import 'package:al_fateh_management/core/widgets/locale_toggle_button.dart';
import 'package:al_fateh_management/core/widgets/theme_toggle_button.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:al_fateh_management/features/home/domain/models/nav_destination_item.dart';

/// شريط التنقل الجانبي المتكيف مع شاشات الديسكتوب والتابلت (Navigation Rail)
class HomeNavigationRail extends StatelessWidget {
  final UserModel user;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool isExpanded;
  final VoidCallback onLogout;

  const HomeNavigationRail({
    super.key,
    required this.user,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.isExpanded = true,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final role = UserRole.fromCode(user.roleId);
    final destinations = NavDestinationItem.getDestinations(role);

    return Container(
      width: isExpanded ? 260 : 76,
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        border: Border(
          right: context.isArabic ? BorderSide.none : BorderSide(color: colors.outlineVariant.withValues(alpha: 0.3)),
          left: context.isArabic ? BorderSide(color: colors.outlineVariant.withValues(alpha: 0.3)) : BorderSide.none,
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isShort = constraints.maxHeight < 440;

            if (isShort) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeader(context, colors),
                    if (isExpanded) _buildUserCard(context, colors, role),
                    const SizedBox(height: 8),
                    ...destinations.asMap().entries.map(
                          (entry) => _buildDestinationItem(
                            context: context,
                            colors: colors,
                            dest: entry.value,
                            index: entry.key,
                          ),
                        ),
                    const Divider(height: 1, thickness: 0.5),
                    _buildFooter(context, colors),
                  ],
                ),
              );
            }

            return Column(
              children: [
                _buildHeader(context, colors),
                if (isExpanded) _buildUserCard(context, colors, role),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: destinations.length,
                    itemBuilder: (ctx, index) => _buildDestinationItem(
                      context: context,
                      colors: colors,
                      dest: destinations[index],
                      index: index,
                    ),
                  ),
                ),
                const Divider(height: 1, thickness: 0.5),
                _buildFooter(context, colors),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ColorScheme colors) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 14),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isExpanded ? 16 : 8),
          child: isExpanded
              ? Row(
                  children: [
                    const AppLogo(size: 36),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.tr('app_name'),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: AppAssets.fontSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: colors.primary,
                            ),
                          ),
                          Text(
                            context.tr('app_subtitle'),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: AppAssets.fontPrimary,
                              fontSize: 10,
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(child: AppLogo(size: 32)),
        ),
        const SizedBox(height: 14),
        const Divider(height: 1, thickness: 0.5),
      ],
    );
  }

  Widget _buildUserCard(BuildContext context, ColorScheme colors, UserRole role) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: colors.primaryContainer,
              child: Text(
                user.username.isNotEmpty ? user.username[0].toUpperCase() : 'U',
                style: TextStyle(
                  fontFamily: AppAssets.fontSecondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: colors.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName.isNotEmpty ? user.fullName : user.username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: AppAssets.fontSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                    decoration: BoxDecoration(
                      color: colors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      context.isArabic ? role.titleAr : role.titleEn,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: AppAssets.fontPrimary,
                        fontSize: 9,
                        color: colors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationItem({
    required BuildContext context,
    required ColorScheme colors,
    required NavDestinationItem dest,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: AppTooltip(
        message: context.tr(dest.titleKey),
        child: AppHover(
          builder: (c, isHovered) {
            return Material(
              color: isSelected
                  ? colors.primary.withValues(alpha: 0.14)
                  : (isHovered
                      ? colors.surfaceContainerHighest.withValues(alpha: 0.6)
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onDestinationSelected(index),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isExpanded ? 14 : 4,
                    vertical: 10,
                  ),
                  child: isExpanded
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              isSelected ? dest.selectedIcon : dest.icon,
                              size: 20,
                              color: isSelected ? colors.primary : colors.onSurfaceVariant,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                context.tr(dest.titleKey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: AppAssets.fontPrimary,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                  fontSize: 13,
                                  color: isSelected ? colors.primary : colors.onSurface,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Icon(
                            isSelected ? dest.selectedIcon : dest.icon,
                            size: 20,
                            color: isSelected ? colors.primary : colors.onSurfaceVariant,
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, ColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isExpanded)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ThemeToggleButton(size: 16),
                Flexible(child: LocaleToggleButton(compact: false)),
              ],
            )
          else
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ThemeToggleButton(size: 16),
                SizedBox(height: 4),
                LocaleToggleButton(compact: true),
              ],
            ),
          const SizedBox(height: 6),
          AppTooltip(
            message: context.tr('logout'),
            child: AppHover(
              builder: (c, isHovered) {
                return Material(
                  color: isHovered ? colors.error.withValues(alpha: 0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      final confirm = await AppConfirmDialog.show(
                        context: context,
                        title: context.tr('confirm_logout_title'),
                        message: context.tr('confirm_logout_msg'),
                        confirmText: context.tr('confirm_logout_button'),
                        variant: ConfirmDialogVariant.danger,
                      );
                      if (confirm) {
                        onLogout();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isExpanded ? 10 : 4,
                        vertical: 8,
                      ),
                      child: isExpanded
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.logout_rounded, size: 18, color: colors.error),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    context.tr('logout'),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: AppAssets.fontPrimary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: colors.error,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Center(
                              child: Icon(Icons.logout_rounded, size: 18, color: colors.error),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
