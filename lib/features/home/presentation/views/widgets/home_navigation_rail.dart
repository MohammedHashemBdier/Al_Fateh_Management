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

/// شريط التنقل الجانبي المتكيف مع شاشات الديسكتوب والتابلت بتصميم عصري وأنيميشن كبسولات تفاعلية
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
    final isArabic = context.isArabic;
    final role = UserRole.fromCode(user.roleId);
    final destinations = NavDestinationItem.getDestinations(role);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOutCubic,
      width: isExpanded ? 260 : 76,
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        border: Border(
          right: isArabic
              ? BorderSide.none
              : BorderSide(color: colors.outlineVariant.withValues(alpha: 0.25), width: 1),
          left: isArabic
              ? BorderSide(color: colors.outlineVariant.withValues(alpha: 0.25), width: 1)
              : BorderSide.none,
        ),
      ),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isShort = constraints.maxHeight < 460;

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
                    const SizedBox(height: 8),
                    _buildDivider(colors),
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
                _buildDivider(colors),
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
                    AppHover(
                      builder: (ctx, isHovered) => AnimatedScale(
                        duration: const Duration(milliseconds: 180),
                        scale: isHovered ? 1.05 : 1.0,
                        child: const AppLogo(size: 38, borderRadius: 10),
                      ),
                    ),
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
                          const SizedBox(height: 2),
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
              : Center(
                  child: AppHover(
                    builder: (ctx, isHovered) => AnimatedScale(
                      duration: const Duration(milliseconds: 180),
                      scale: isHovered ? 1.08 : 1.0,
                      child: const AppLogo(size: 32, borderRadius: 8),
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 14),
        _buildDivider(colors),
      ],
    );
  }

  Widget _buildUserCard(BuildContext context, ColorScheme colors, UserRole role) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: colors.outlineVariant.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            // صورة المستخدم الرمزية مع مؤشر الاتصال المباشر الأخضر
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 17,
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
                Positioned(
                  bottom: -1,
                  right: -1,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.success,
                      border: Border.all(color: colors.surface, width: 1.5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
    final isArabic = context.isArabic;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      child: AppTooltip(
        message: context.tr(dest.titleKey),
        child: AppHover(
          builder: (c, isHovered) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              transform: Matrix4.translationValues(
                isHovered ? (isArabic ? -3.0 : 3.0) : 0.0,
                0.0,
                0.0,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? colors.primary.withValues(alpha: 0.14)
                    : (isHovered
                        ? colors.surfaceContainerHighest.withValues(alpha: 0.6)
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? colors.primary.withValues(alpha: 0.3)
                      : Colors.transparent,
                  width: 1,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onDestinationSelected(index),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isExpanded ? 12 : 6,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: isExpanded
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      // المؤشر النشط العمودي النابض
                      if (isExpanded) ...[
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 3.5,
                          height: isSelected ? 18 : 0,
                          decoration: BoxDecoration(
                            color: isSelected ? colors.primary : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: isSelected ? 8 : 4),
                      ],

                      // أيقونة الوجهة مع أنيميشن التكبير
                      AnimatedScale(
                        duration: const Duration(milliseconds: 180),
                        scale: isSelected ? 1.08 : 1.0,
                        child: Icon(
                          isSelected ? dest.selectedIcon : dest.icon,
                          size: 20,
                          color: isSelected
                              ? colors.primary
                              : colors.onSurfaceVariant,
                        ),
                      ),

                      if (isExpanded) ...[
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            context.tr(dest.titleKey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: AppAssets.fontPrimary,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              fontSize: 13,
                              color: isSelected
                                  ? colors.primary
                                  : colors.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDivider(ColorScheme colors) {
    return Divider(
      height: 1,
      thickness: 0.8,
      color: colors.outlineVariant.withValues(alpha: 0.2),
    );
  }

  Widget _buildFooter(BuildContext context, ColorScheme colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // أدوات الثيم واللغة
          if (isExpanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colors.outlineVariant.withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ThemeToggleButton(size: 17),
                  Flexible(child: LocaleToggleButton(compact: false)),
                ],
              ),
            )
          else
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ThemeToggleButton(size: 17),
                SizedBox(height: 6),
                LocaleToggleButton(compact: true),
              ],
            ),
          const SizedBox(height: 8),

          // زر تسجيل الخروج مع تأثير Hover تحذيري ناعم
          AppTooltip(
            message: context.tr('logout'),
            child: AppHover(
              builder: (c, isHovered) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  decoration: BoxDecoration(
                    color: isHovered
                        ? colors.error.withValues(alpha: 0.12)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isHovered
                          ? colors.error.withValues(alpha: 0.3)
                          : Colors.transparent,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
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
                        horizontal: isExpanded ? 12 : 6,
                        vertical: 9,
                      ),
                      child: isExpanded
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.logout_rounded,
                                  size: 18,
                                  color: colors.error,
                                ),
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
                              child: Icon(
                                Icons.logout_rounded,
                                size: 18,
                                color: colors.error,
                              ),
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
