import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';

/// ويدجيت عرض الأخطاء مع زر إعادة المحاولة (Attendance Error State)
class AttendanceErrorState extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const AttendanceErrorState({
    super.key,
    required this.errorMessage,
    this.onRetry,
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
                color: colors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: AppDimens.iconHero,
                color: colors.error,
              ),
            ),
            const SizedBox(height: AppDimens.spacingLarge),
            AppText.headline(
              'error_title',
              textAlign: TextAlign.center,
              fontFamily: AppAssets.fontSecondary,
              fontWeight: FontWeight.bold,
              color: colors.onSurface,
            ),
            const SizedBox(height: AppDimens.space6),
            AppText.body(
              errorMessage,
              textAlign: TextAlign.center,
              color: colors.onSurfaceVariant,
              isTranslated: false,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppDimens.spacingLarge),
              AppButton(
                label: context.tr('retry'),
                icon: Icons.refresh_rounded,
                onPressed: onRetry,
                variant: AppButtonVariant.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
