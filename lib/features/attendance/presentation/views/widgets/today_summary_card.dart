import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/models/shift.dart';
import '../../../domain/models/today_status.dart';

/// بطاقة ملخص ساعات دوام اليوم ونسبة الإنجاز (Today Summary Card)
class TodaySummaryCard extends StatelessWidget {
  final TodayStatus? todayStatus;
  final Shift? currentShift;

  const TodaySummaryCard({
    super.key,
    required this.todayStatus,
    this.currentShift,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final record = todayStatus?.record;

    final standardHours = currentShift?.standardHours ?? 8.0;
    final actualHours = record?.actualHours ?? 0.0;
    final overtimeHours = record?.overtimeHours ?? 0.0;

    final progress = standardHours > 0
        ? (actualHours / standardHours).clamp(0.0, 1.0)
        : 0.0;

    final shiftName =
        currentShift?.shiftName ?? context.tr('att_shift_default');
    final shiftTiming = currentShift != null
        ? '${currentShift!.startTime} - ${currentShift!.endTime}'
        : '--:-- - --:--';

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.caption(
                    'att_today_shift_info',
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppDimens.space4),
                  AppText.title(
                    shiftName,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppAssets.fontSecondary,
                    isTranslated: false,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.space12,
                  vertical: AppDimens.space6,
                ),
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.1),
                  borderRadius: AppRadii.full,
                  border: Border.all(
                    color: colors.primary.withValues(alpha: 0.25),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: AppDimens.iconSm,
                      color: colors.primary,
                    ),
                    const SizedBox(width: AppDimens.space6),
                    Text(
                      shiftTiming,
                      style: TextStyle(
                        fontFamily: AppAssets.fontPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: colors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacingLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.label(
                'att_worked_hours_progress',
                color: colors.onSurfaceVariant,
              ),
              AppText.literal(
                '${actualHours.toStringAsFixed(1)} / ${standardHours.toStringAsFixed(1)} ${context.tr('att_hours_short')}',
                variant: AppTextVariant.labelLarge,
                fontWeight: FontWeight.bold,
                color: colors.onSurface,
              ),
            ],
          ),
          const SizedBox(height: AppDimens.space8),
          ClipRRect(
            borderRadius: AppRadii.full,
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: colors.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(
                progress >= 1.0 ? colors.success : colors.primary,
              ),
            ),
          ),
          if (overtimeHours > 0) ...[
            const SizedBox(height: AppDimens.spacingMedium),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.space12,
                vertical: AppDimens.space8,
              ),
              decoration: BoxDecoration(
                color: colors.success.withValues(alpha: 0.1),
                borderRadius: AppRadii.sm,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.trending_up_rounded,
                    size: AppDimens.iconSm,
                    color: colors.success,
                  ),
                  const SizedBox(width: AppDimens.space8),
                  AppText.literal(
                    '${context.tr('att_overtime_earned')}: +${overtimeHours.toStringAsFixed(1)} ${context.tr('att_hours_short')}',
                    variant: AppTextVariant.bodySmall,
                    fontWeight: FontWeight.bold,
                    color: colors.success,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
