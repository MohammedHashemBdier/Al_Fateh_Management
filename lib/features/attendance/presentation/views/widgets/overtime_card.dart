import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/enums/attendance_enums.dart';
import '../../../domain/models/overtime_record.dart';

/// بطاقة عرض سجل ساعات العمل الإضافي (Overtime Record Card)
class OvertimeCard extends StatelessWidget {
  final OvertimeRecord record;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;

  const OvertimeCard({
    super.key,
    required this.record,
    this.onApprove,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final statusLabel = context.isArabic
        ? record.status.labelAr
        : record.status.labelEn;

    Color statusColor;
    switch (record.status) {
      case OvertimeStatus.approved:
        statusColor = colors.success;
        break;
      case OvertimeStatus.pending:
        statusColor = colors.warning;
        break;
      case OvertimeStatus.rejected:
        statusColor = colors.error;
        break;
    }

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppDimens.space8),
                    decoration: BoxDecoration(
                      color: colors.info.withValues(alpha: 0.1),
                      borderRadius: AppRadii.sm,
                    ),
                    child: Icon(
                      Icons.trending_up_rounded,
                      size: AppDimens.iconMd,
                      color: colors.info,
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingSmall),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.literal(
                        record.workDate,
                        variant: AppTextVariant.titleMedium,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppAssets.fontSecondary,
                        color: colors.onSurface,
                      ),
                      AppText.literal(
                        '+${record.durationHours.toStringAsFixed(1)} ${context.tr('att_hours_short')} (${record.rateMultiplier}x)',
                        variant: AppTextVariant.caption,
                        fontWeight: FontWeight.bold,
                        color: colors.info,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.space10,
                  vertical: AppDimens.space4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: AppRadii.full,
                  border: Border.all(color: statusColor.withValues(alpha: 0.3)),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyle(
                    fontFamily: AppAssets.fontPrimary,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          if (record.reason.isNotEmpty) ...[
            const SizedBox(height: AppDimens.spacingSmall),
            AppText.literal(
              record.reason,
              variant: AppTextVariant.bodyMedium,
              color: colors.onSurfaceVariant,
            ),
          ],
          if (record.status == OvertimeStatus.pending &&
              (onApprove != null || onReject != null)) ...[
            const SizedBox(height: AppDimens.spacingMedium),
            const AppDivider(),
            const SizedBox(height: AppDimens.spacingSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (onReject != null)
                  AppButton(
                    label: context.tr('reject'),
                    height: AppDimens.buttonHeightSm,
                    variant: AppButtonVariant.outlined,
                    customColor: colors.error,
                    onPressed: onReject,
                  ),
                if (onApprove != null) ...[
                  const SizedBox(width: AppDimens.spacingSmall),
                  AppButton(
                    label: context.tr('approve'),
                    height: AppDimens.buttonHeightSm,
                    variant: AppButtonVariant.primary,
                    customColor: colors.success,
                    onPressed: onApprove,
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
