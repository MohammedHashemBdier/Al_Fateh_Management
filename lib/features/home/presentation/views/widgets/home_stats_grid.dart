import 'package:flutter/material.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/rbac/role_permissions.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
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

    // تجهيز البطاقات الأربعة
    final cards = [
      _StatCardData(
        titleKey: 'stat_total_tickets',
        value: stats!.totalTickets.toString(),
        icon: Icons.confirmation_number_outlined,
        color: const Color(0xff3b82f6),
        tooltipKey: 'stat_total_tickets',
      ),
      _StatCardData(
        titleKey: 'stat_in_progress',
        value: stats!.inProgressTickets.toString(),
        icon: Icons.pending_actions_rounded,
        color: const Color(0xfff59e0b),
        tooltipKey: 'stat_in_progress',
      ),
      _StatCardData(
        titleKey: 'stat_resolved_today',
        value: stats!.resolvedToday.toString(),
        icon: Icons.task_alt_rounded,
        color: const Color(0xff10b981),
        tooltipKey: 'stat_resolved_today',
      ),
      // البطاقة الرابعة تتكيف حسب الدور:
      // الموظف العادي يرى حالة دوامه، الإدارة والمالية يرون عدد الموظفين النشطين
      role.isDepartmentManager || role.isAdmin || role.isFinance
          ? _StatCardData(
              titleKey: 'stat_active_users',
              value: stats!.activeEmployeesCount.toString(),
              icon: Icons.people_outline_rounded,
              color: const Color(0xff8b5cf6),
              tooltipKey: 'stat_active_users',
            )
          : _StatCardData(
              titleKey: 'stat_attendance_status',
              value: stats!.isCheckedInToday
                  ? context.tr('stat_present')
                  : context.tr('stat_not_checked_in'),
              icon: Icons.access_time_rounded,
              color: stats!.isCheckedInToday ? const Color(0xff10b981) : const Color(0xffef4444),
              tooltipKey: 'stat_attendance_status',
            ),
    ];

    return ResponsiveBuilder(
      desktop: (ctx) => Row(
        children: cards
            .map((card) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: _buildCardItem(ctx, card),
                  ),
                ))
            .toList(),
      ),
      tablet: (ctx) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.3,
        children: cards.map((c) => _buildCardItem(ctx, c)).toList(),
      ),
      mobile: (ctx) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.05,
        children: cards.map((c) => _buildCardItem(ctx, c)).toList(),
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
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0, isHovered ? -3 : 0, 0),
            child: AppCard(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              borderColor: isHovered ? data.color.withValues(alpha: 0.5) : null,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.topStart,
                child: SizedBox(
                  width: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: data.color.withValues(alpha: isHovered ? 0.2 : 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(data.icon, color: data.color, size: 18),
                          ),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isHovered ? data.color : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          data.value,
                          maxLines: 1,
                          style: context.textTheme.titleLarge?.copyWith(
                            fontFamily: AppAssets.fontSecondary,
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        context.tr(data.titleKey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodySmall?.copyWith(
                          fontFamily: AppAssets.fontPrimary,
                          color: colors.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
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
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: AppSkeleton(height: 110, borderRadius: 16),
            ),
          ),
        ),
      ),
      tablet: (ctx) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.3,
        children: List.generate(
          4,
          (i) => const AppSkeleton(height: 100, borderRadius: 14),
        ),
      ),
      mobile: (ctx) => GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.05,
        children: List.generate(
          4,
          (i) => const AppSkeleton(height: 100, borderRadius: 14),
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
