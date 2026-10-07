import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../domain/enums/attendance_enums.dart';

/// شارة توضيح حالة مزامنة السجل مع السيرفر السحابي (Cloud Sync Status)
class SyncStatusBadge extends StatelessWidget {
  final SyncStatus status;
  final int pendingCount;
  final VoidCallback? onSyncTap;

  const SyncStatusBadge({
    super.key,
    required this.status,
    this.pendingCount = 0,
    this.onSyncTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Color badgeColor;
    IconData badgeIcon;
    String labelKey;

    switch (status) {
      case SyncStatus.synced:
        badgeColor = colors.success;
        badgeIcon = Icons.cloud_done_rounded;
        labelKey = 'sync_status_synced';
        break;
      case SyncStatus.pending:
        badgeColor = colors.warning;
        badgeIcon = Icons.cloud_queue_rounded;
        labelKey = pendingCount > 0
            ? context
                  .tr('sync_status_pending_count')
                  .replaceAll('{count}', '$pendingCount')
            : context.tr('sync_status_pending');
        break;
      case SyncStatus.failed:
        badgeColor = colors.error;
        badgeIcon = Icons.cloud_off_rounded;
        labelKey = 'sync_status_failed';
        break;
      case SyncStatus.conflict:
        badgeColor = colors.tertiary;
        badgeIcon = Icons.sync_problem_rounded;
        labelKey = 'sync_status_conflict';
        break;
    }

    final isClickable = onSyncTap != null && status != SyncStatus.synced;

    return InkWell(
      onTap: isClickable ? onSyncTap : null,
      borderRadius: AppRadii.full,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.space10,
          vertical: AppDimens.space4,
        ),
        decoration: BoxDecoration(
          color: badgeColor.withValues(alpha: 0.12),
          borderRadius: AppRadii.full,
          border: Border.all(color: badgeColor.withValues(alpha: 0.35)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(badgeIcon, size: AppDimens.iconXs, color: badgeColor),
            const SizedBox(width: AppDimens.space4),
            Text(
              status == SyncStatus.pending && pendingCount > 0
                  ? labelKey
                  : context.tr(labelKey),
              style: TextStyle(
                fontFamily: AppAssets.fontPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: badgeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
