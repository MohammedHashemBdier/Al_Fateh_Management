import 'package:flutter/material.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/app_tooltip.dart';

/// شارة حالة الاتصال وطابور المزامنة التلقائية
class TicketSyncBadge extends StatelessWidget {
  final bool isOffline;
  final bool isSyncing;
  final int pendingCount;
  final VoidCallback onSyncNow;

  const TicketSyncBadge({
    super.key,
    required this.isOffline,
    required this.isSyncing,
    required this.pendingCount,
    required this.onSyncNow,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final badgeColor = isSyncing
        ? colors.info
        : isOffline
            ? colors.warning
            : colors.success;

    final label = isSyncing
        ? context.tr('status_syncing')
        : isOffline
            ? context.tr('status_offline_cache')
            : context.tr('status_connected');

    return InkWell(
      onTap: isSyncing ? null : onSyncNow,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: badgeColor.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: badgeColor.withValues(alpha: 0.35),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSyncing)
              SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(badgeColor),
                ),
              )
            else
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: badgeColor,
                ),
              ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontFamily: AppAssets.fontPrimary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: badgeColor,
              ),
            ),
            if (pendingCount > 0) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(
                  color: colors.warning,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$pendingCount',
                  style: TextStyle(
                    fontFamily: AppAssets.fontPrimary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: colors.onWarning,
                  ),
                ),
              ),
            ],
            const SizedBox(width: 4),
            AppTooltip(
              message: context.tr('sync_now_tooltip'),
              child: Icon(
                Icons.sync_rounded,
                size: 14,
                color: badgeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
