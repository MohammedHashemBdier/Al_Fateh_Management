import 'package:flutter/material.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/rbac/role_permissions.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/core/widgets/app_animations.dart';
import 'package:al_fateh_management/core/widgets/app_card.dart';
import 'package:al_fateh_management/core/widgets/app_hover.dart';
import 'package:al_fateh_management/core/widgets/app_skeleton.dart';
import 'package:al_fateh_management/core/widgets/app_tooltip.dart';
import 'package:al_fateh_management/core/widgets/responsive_builder.dart';
import 'package:al_fateh_management/features/auth/domain/models/user_model.dart';
import 'package:al_fateh_management/features/home/domain/models/dashboard_stats_model.dart';

/// شبكة بطاقات الإحصائيات المتجاوبة مع دعم Hover و Skeleton
class HomeStatsGrid extends StatelessWidget {
  final DashboardStatsModel? stats;
  final UserModel user;
  final bool isLoading;

  const HomeStatsGrid({
    super.key,
    this.stats,
    required this.user,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading || stats == null) {
      return _buildSkeletonGrid(context);
    }

    final role = UserRole.fromCode(user.roleId);

    final colors = context.colors;

    // تجهيز البطاقات الأربعة بألوان ديناميكية مأخوذة من ثيم التطبيق
    final cards = [
      _StatCardData(
        titleKey: 'stat_total_tickets',
        value: stats!.totalTickets.toString(),
        icon: Icons.confirmation_number_outlined,
        color: colors.info,
        tooltipKey: 'stat_total_tickets',
      ),
      _StatCardData(
        titleKey: 'stat_in_progress',
        value: stats!.inProgressTickets.toString(),
        icon: Icons.pending_actions_rounded,
        color: colors.warning,
        tooltipKey: 'stat_in_progress',
      ),
      _StatCardData(
        titleKey: 'stat_resolved_today',
        value: stats!.resolvedToday.toString(),
        icon: Icons.task_alt_rounded,
        color: colors.success,
        tooltipKey: 'stat_resolved_today',
      ),
      // البطاقة الرابعة تتكيف حسب الدور:
      // الموظف العادي يرى حالة دوامه، الإدارة والمالية يرون عدد الموظفين النشطين
      role.isDepartmentManager || role.isAdmin || role.isFinance
          ? _StatCardData(
              titleKey: 'stat_active_users',
              value: stats!.activeEmployeesCount.toString(),
              icon: Icons.people_outline_rounded,
              color: colors.tertiary,
              tooltipKey: 'stat_active_users',
            )
          : _StatCardData(
              titleKey: 'stat_attendance_status',
              value: stats!.isCheckedInToday
                  ? context.tr('stat_present')
                  : context.tr('stat_not_checked_in'),
              icon: Icons.access_time_rounded,
              color: stats!.isCheckedInToday ? colors.success : colors.error,
              tooltipKey: 'stat_attendance_status',
            ),
    ];

    return ResponsiveBuilder(
      desktop: (ctx) => Row(
        children: cards
            .asMap()
            .entries
            .map((entry) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: SizedBox(
                      height: 76,
                      child: AppFadeSlide(
                        delay: Duration(milliseconds: 60 + entry.key * 50),
                        scaleIn: true,
                        child: _buildCardItem(ctx, entry.value),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
      tablet: (ctx) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.9,
        children: cards
            .asMap()
            .entries
            .map((entry) => AppFadeSlide(
                  delay: Duration(milliseconds: 60 + entry.key * 50),
                  scaleIn: true,
                  child: _buildCardItem(ctx, entry.value),
                ))
            .toList(),
      ),
      mobile: (ctx) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.55,
        children: cards
            .asMap()
            .entries
            .map((entry) => AppFadeSlide(
                  delay: Duration(milliseconds: 60 + entry.key * 50),
                  scaleIn: true,
                  child: _buildCardItem(ctx, entry.value),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildCardItem(BuildContext context, _StatCardData data) {
    final colors = context.colors;

    return AppTooltip(
      message: context.tr(data.tooltipKey),
      child: AppHover(
        builder: (ctx, isHovered) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            transform: Matrix4.translationValues(0, isHovered ? -2 : 0, 0),
            child: AppCard(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              borderRadius: 14,
              borderColor: isHovered
                  ? data.color.withValues(alpha: 0.45)
                  : colors.outlineVariant.withValues(alpha: 0.3),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: data.color.withValues(alpha: isHovered ? 0.18 : 0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: data.color.withValues(alpha: isHovered ? 0.4 : 0.18),
                        width: 1,
                      ),
                    ),
                    child: Icon(data.icon, color: data.color, size: 18),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            data.value,
                            maxLines: 1,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontFamily: AppAssets.fontSecondary,
                              fontWeight: FontWeight.w800,
                              color: colors.onSurface,
                              fontSize: 18,
                              letterSpacing: -0.3,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            context.tr(data.titleKey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: AppAssets.fontPrimary,
                              color: colors.onSurfaceVariant,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSkeletonGrid(BuildContext context) {
    return ResponsiveBuilder(
      desktop: (ctx) => Row(
        children: List.generate(
          4,
          (i) => const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: AppSkeleton(height: 76, borderRadius: 14),
            ),
          ),
        ),
      ),
      tablet: (ctx) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.9,
        children: List.generate(
          4,
          (i) => const AppSkeleton(height: 76, borderRadius: 14),
        ),
      ),
      mobile: (ctx) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.55,
        children: List.generate(
          4,
          (i) => const AppSkeleton(height: 76, borderRadius: 14),
        ),
      ),
    );
  }
}

class _StatCardData {
  final String titleKey;
  final String value;
  final IconData icon;
  final Color color;
  final String tooltipKey;

  const _StatCardData({
    required this.titleKey,
    required this.value,
    required this.icon,
    required this.color,
    required this.tooltipKey,
  });
}
