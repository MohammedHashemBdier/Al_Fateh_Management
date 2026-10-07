import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/enums/attendance_enums.dart';
import '../../../domain/models/attendance_record.dart';

/// ويدجيت ملخص الأسبوع لإحصائيات ساعات الدوام والتأخير والإضافي
class WeekSummaryWidget extends StatelessWidget {
  final List<AttendanceRecord> records;

  const WeekSummaryWidget({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompact = context.isMobile;

    double totalHours = 0;
    int lateMinutes = 0;
    double overtimeHours = 0;
    int presentDays = 0;

    for (final r in records) {
      totalHours += r.actualHours;
      lateMinutes += r.lateMinutes;
      overtimeHours += r.overtimeHours;
      if (r.status == AttendanceStatus.present ||
          r.status == AttendanceStatus.late ||
          r.status == AttendanceStatus.halfDay) {
        presentDays++;
      }
    }

    final items = [
      _SummaryStat(
        title: 'att_week_total_hours',
        value:
            '${totalHours.toStringAsFixed(1)} ${context.tr('att_hours_short')}',
        icon: Icons.timer_outlined,
        color: colors.primary,
      ),
      _SummaryStat(
        title: 'att_week_present_days',
        value: '$presentDays ${context.tr('att_days_short')}',
        icon: Icons.calendar_today_rounded,
        color: colors.success,
      ),
      _SummaryStat(
        title: 'att_week_late_minutes',
        value: '$lateMinutes ${context.tr('att_mins_short')}',
        icon: Icons.warning_amber_rounded,
        color: colors.warning,
      ),
      _SummaryStat(
        title: 'att_week_overtime_hours',
        value:
            '${overtimeHours.toStringAsFixed(1)} ${context.tr('att_hours_short')}',
        icon: Icons.trending_up_rounded,
        color: colors.info,
      ),
    ];

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.date_range_rounded,
                size: AppDimens.iconMd,
                color: colors.primary,
              ),
              const SizedBox(width: AppDimens.spacingSmall),
              AppText.title(
                'att_week_summary_title',
                fontWeight: FontWeight.bold,
                fontFamily: AppAssets.fontSecondary,
                color: colors.onSurface,
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacingMedium),
          if (isCompact)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppDimens.spacingSmall,
                mainAxisSpacing: AppDimens.spacingSmall,
                childAspectRatio: 2.1,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  _buildStatBox(context, items[index]),
            )
          else
            Row(
              children: items
                  .map(
                    (stat) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.space4,
                        ),
                        child: _buildStatBox(context, stat),
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildStatBox(BuildContext context, _SummaryStat stat) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingSmall),
      decoration: BoxDecoration(
        color: stat.color.withValues(alpha: 0.08),
        borderRadius: AppRadii.md,
        border: Border.all(color: stat.color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.space8),
            decoration: BoxDecoration(
              color: stat.color.withValues(alpha: 0.15),
              borderRadius: AppRadii.sm,
            ),
            child: Icon(stat.icon, color: stat.color, size: AppDimens.iconSm),
          ),
          const SizedBox(width: AppDimens.spacingSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.caption(
                  stat.title,
                  color: colors.onSurfaceVariant,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppDimens.space2),
                AppText.literal(
                  stat.value,
                  variant: AppTextVariant.bodyMedium,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryStat {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryStat({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}
