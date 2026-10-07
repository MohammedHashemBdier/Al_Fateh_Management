import 'package:flutter/material.dart';

import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';

/// مؤشر حالة الـ GPS ودقة تحديد الموقع مع إمكانية توجيه المستخدم للإعدادات
class GpsStatusIndicator extends StatelessWidget {
  final bool isGpsDisabled;
  final bool isPermissionDenied;
  final bool isPermissionDeniedForever;
  final double? accuracyMeters;
  final double maxAllowedAccuracy;
  final bool isChecking;
  final VoidCallback? onOpenSettings;
  final VoidCallback? onRefresh;

  const GpsStatusIndicator({
    super.key,
    required this.isGpsDisabled,
    required this.isPermissionDenied,
    required this.isPermissionDeniedForever,
    this.accuracyMeters,
    this.maxAllowedAccuracy = 30.0,
    this.isChecking = false,
    this.onOpenSettings,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final isError =
        isGpsDisabled || isPermissionDenied || isPermissionDeniedForever;
    final isAccuracyLow =
        accuracyMeters != null && accuracyMeters! > maxAllowedAccuracy;

    Color statusColor;
    IconData statusIcon;
    String statusTitle;
    String statusSubtitle;

    if (isChecking) {
      statusColor = colors.info;
      statusIcon = Icons.gps_not_fixed_rounded;
      statusTitle = 'gps_locating_title';
      statusSubtitle = 'gps_locating_desc';
    } else if (isGpsDisabled) {
      statusColor = colors.error;
      statusIcon = Icons.location_off_rounded;
      statusTitle = 'gps_disabled_title';
      statusSubtitle = 'gps_disabled_desc';
    } else if (isPermissionDeniedForever) {
      statusColor = colors.error;
      statusIcon = Icons.security_rounded;
      statusTitle = 'gps_perm_forever_title';
      statusSubtitle = 'gps_perm_forever_desc';
    } else if (isPermissionDenied) {
      statusColor = colors.warning;
      statusIcon = Icons.location_searching_rounded;
      statusTitle = 'gps_perm_denied_title';
      statusSubtitle = 'gps_perm_denied_desc';
    } else if (isAccuracyLow) {
      statusColor = colors.warning;
      statusIcon = Icons.gps_not_fixed_rounded;
      statusTitle = 'gps_low_accuracy_title';
      statusSubtitle = context
          .tr('gps_accuracy_val')
          .replaceAll('{val}', accuracyMeters!.toStringAsFixed(1));
    } else {
      statusColor = colors.success;
      statusIcon = Icons.gps_fixed_rounded;
      statusTitle = 'gps_ready_title';
      statusSubtitle = accuracyMeters != null
          ? context
                .tr('gps_accuracy_val')
                .replaceAll('{val}', accuracyMeters!.toStringAsFixed(1))
          : context.tr('gps_ready_desc');
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingMedium,
        vertical: AppDimens.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: AppRadii.md,
        border: Border.all(color: statusColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.space8),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(statusIcon, color: statusColor, size: AppDimens.iconMd),
          ),
          const SizedBox(width: AppDimens.spacingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  statusTitle,
                  variant: AppTextVariant.labelLarge,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
                const SizedBox(height: AppDimens.space2),
                AppText.literal(
                  statusSubtitle,
                  variant: AppTextVariant.caption,
                  color: colors.onSurfaceVariant,
                ),
              ],
            ),
          ),
          if (isError && onOpenSettings != null) ...[
            const SizedBox(width: AppDimens.spacingSmall),
            AppButton(
              label: context.tr('gps_settings_btn'),
              height: AppDimens.buttonHeightSm,
              variant: AppButtonVariant.outlined,
              customColor: statusColor,
              onPressed: onOpenSettings,
            ),
          ] else if (onRefresh != null) ...[
            const SizedBox(width: AppDimens.spacingSmall),
            IconButton(
              icon: Icon(
                Icons.refresh_rounded,
                size: AppDimens.iconMd,
                color: colors.onSurfaceVariant,
              ),
              onPressed: isChecking ? null : onRefresh,
              tooltip: context.tr('refresh'),
            ),
          ],
        ],
      ),
    );
  }
}
