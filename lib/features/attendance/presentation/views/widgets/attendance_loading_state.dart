import 'package:flutter/material.dart';

import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/widgets/widgets.dart';

/// ويدجيت هيكل التحميل الوميضي (Shimmer Skeleton Loading State)
class AttendanceLoadingState extends StatelessWidget {
  final int itemCount;

  const AttendanceLoadingState({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // بطاقة علوية وميضية
          const AppSkeleton(height: 140, borderRadius: AppRadii.lgValue),
          const SizedBox(height: AppDimens.spacingLarge),
          // قائمة العناصر
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            separatorBuilder: (_, _) =>
                const SizedBox(height: AppDimens.spacingSmall),
            itemBuilder: (_, _) =>
                const AppSkeleton(height: 80, borderRadius: AppRadii.mdValue),
          ),
        ],
      ),
    );
  }
}
