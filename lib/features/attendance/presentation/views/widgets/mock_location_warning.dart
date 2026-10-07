import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';

/// تنبيه أمني بارز يظهر عند اكتشاف تزييف الـ GPS (Mock Location Alert)
class MockLocationWarning extends StatelessWidget {
  const MockLocationWarning({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      decoration: BoxDecoration(
        color: colors.error.withValues(alpha: 0.1),
        borderRadius: AppRadii.md,
        border: Border.all(color: colors.error.withValues(alpha: 0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.space8),
            decoration: BoxDecoration(
              color: colors.error.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.warning_amber_rounded,
              color: colors.error,
              size: AppDimens.iconLg,
            ),
          ),
          const SizedBox(width: AppDimens.spacingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'mock_location_title',
                  variant: AppTextVariant.labelLarge,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppAssets.fontSecondary,
                  color: colors.error,
                ),
                const SizedBox(height: AppDimens.space4),
                AppText.caption('mock_location_desc', color: colors.onSurface),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
