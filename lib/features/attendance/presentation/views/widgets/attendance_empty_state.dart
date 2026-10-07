import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';

/// ويدجيت الحالة الفارغة لسجلات وقوائم الدوام (Attendance Empty State)
class AttendanceEmptyState extends StatelessWidget {
  final String? message;
  final String? subtitle;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  const AttendanceEmptyState({
    super.key,
    this.message,
    this.subtitle,
    this.icon = Icons.event_busy_rounded,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.paddingXLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(AppDimens.paddingLarge),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: AppDimens.iconHero,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: AppDimens.spacingLarge),
            AppText.headline(
              message ?? 'att_no_records_title',
              textAlign: TextAlign.center,
              fontFamily: AppAssets.fontSecondary,
              fontWeight: FontWeight.bold,
              color: colors.onSurface,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppDimens.space6),
              AppText.body(
                subtitle!,
                textAlign: TextAlign.center,
                color: colors.onSurfaceVariant,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppDimens.spacingLarge),
              AppButton(
                label: actionLabel!,
                onPressed: onAction,
                variant: AppButtonVariant.tonal,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
