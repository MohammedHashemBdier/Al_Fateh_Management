import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/enums/attendance_enums.dart';
import '../../../domain/models/deduction.dart';

/// بطاقة عرض الخصومات المالية أو الزمنية (Deduction Card)
class DeductionCard extends StatelessWidget {
  final Deduction deduction;

  const DeductionCard({super.key, required this.deduction});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final typeLabel = context.isArabic
        ? deduction.type.labelAr
        : deduction.type.labelEn;

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
                      color: colors.error.withValues(alpha: 0.1),
                      borderRadius: AppRadii.sm,
                    ),
                    child: Icon(
                      Icons.money_off_csred_rounded,
                      size: AppDimens.iconMd,
                      color: colors.error,
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingSmall),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.literal(
                        deduction.deductionDate,
                        variant: AppTextVariant.titleMedium,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppAssets.fontSecondary,
                        color: colors.onSurface,
                      ),
                      AppText.literal(
                        typeLabel,
                        variant: AppTextVariant.caption,
                        color: colors.error,
                        fontWeight: FontWeight.bold,
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
                  color: colors.error.withValues(alpha: 0.12),
                  borderRadius: AppRadii.full,
                  border: Border.all(
                    color: colors.error.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  '-${deduction.amountOrHours} ${deduction.type == DeductionType.late ? context.tr('att_mins_short') : context.tr('currency_sp')}',
                  style: TextStyle(
                    fontFamily: AppAssets.fontPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: colors.error,
                  ),
                ),
              ),
            ],
          ),
          if (deduction.reason.isNotEmpty) ...[
            const SizedBox(height: AppDimens.spacingSmall),
            AppText.literal(
              deduction.reason,
              variant: AppTextVariant.bodyMedium,
              color: colors.onSurfaceVariant,
            ),
          ],
        ],
      ),
    );
  }
}
