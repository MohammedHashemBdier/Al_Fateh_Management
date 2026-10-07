import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/models/shift.dart';

/// بطاقة عرض تفاصيل الوردية وفترة العمل (Shift Management Card)
class ShiftCard extends StatelessWidget {
  final Shift shift;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ShiftCard({super.key, required this.shift, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

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
                      color: colors.primary.withValues(alpha: 0.1),
                      borderRadius: AppRadii.sm,
                    ),
                    child: Icon(
                      Icons.schedule_rounded,
                      size: AppDimens.iconMd,
                      color: colors.primary,
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingSmall),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.literal(
                        shift.shiftName,
                        variant: AppTextVariant.titleMedium,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppAssets.fontSecondary,
                        color: colors.onSurface,
                      ),
                      AppText.literal(
                        '${shift.startTime} - ${shift.endTime}',
                        variant: AppTextVariant.caption,
                        color: colors.onSurfaceVariant,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.space10,
                      vertical: AppDimens.space4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          (shift.isActive
                                  ? colors.success
                                  : colors.outlineVariant)
                              .withValues(alpha: 0.15),
                      borderRadius: AppRadii.full,
                    ),
                    child: Text(
                      context.tr(shift.isActive ? 'active' : 'inactive'),
                      style: TextStyle(
                        fontFamily: AppAssets.fontPrimary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: shift.isActive
                            ? colors.success
                            : colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                  if (onEdit != null) ...[
                    const SizedBox(width: AppDimens.space4),
                    IconButton(
                      icon: Icon(
                        Icons.edit_outlined,
                        size: AppDimens.iconSm,
                        color: colors.primary,
                      ),
                      onPressed: onEdit,
                      tooltip: context.tr('edit'),
                    ),
                  ],
                  if (onDelete != null)
                    IconButton(
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        size: AppDimens.iconSm,
                        color: colors.error,
                      ),
                      onPressed: onDelete,
                      tooltip: context.tr('delete'),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacingMedium),
          const AppDivider(),
          const SizedBox(height: AppDimens.spacingSmall),
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  context,
                  title: 'shift_standard_hours',
                  value:
                      '${shift.standardHours} ${context.tr('att_hours_short')}',
                ),
              ),
              Expanded(
                child: _buildDetailItem(
                  context,
                  title: 'shift_grace_period',
                  value:
                      '${shift.gracePeriodMins} ${context.tr('att_mins_short')}',
                ),
              ),
              Expanded(
                child: _buildDetailItem(
                  context,
                  title: 'shift_overtime_threshold',
                  value:
                      '${shift.overtimeThresholdMins} ${context.tr('att_mins_short')}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.caption(title, color: colors.onSurfaceVariant),
        const SizedBox(height: AppDimens.space2),
        AppText.literal(
          value,
          variant: AppTextVariant.bodyMedium,
          fontWeight: FontWeight.bold,
          color: colors.onSurface,
        ),
      ],
    );
  }
}
