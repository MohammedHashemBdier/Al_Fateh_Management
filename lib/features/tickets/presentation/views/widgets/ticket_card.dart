import 'package:flutter/material.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_status_badge.dart';
import '../../../../../core/widgets/app_tooltip.dart';
import '../../../domain/models/ticket_model.dart';

/// بطاقة التذكرة المخصصة للعرض على الموبايل والشاشات الصغيرة
class TicketCard extends StatelessWidget {
  final TicketModel ticket;
  final VoidCallback onTap;
  final ValueChanged<String>? onStatusQuickChange;

  const TicketCard({
    super.key,
    required this.ticket,
    required this.onTap,
    this.onStatusQuickChange,
  });

  String _formatDate(String date) {
    if (date.contains('00:00:00')) {
      return date.replaceAll('00:00:00', '').trim();
    }
    return date.trim();
  }

  String _formatTime(String time) {
    if (time.contains('1899/12/30')) {
      return time.replaceAll('1899/12/30', '').trim();
    }
    return time.trim();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final formattedDate = _formatDate(ticket.date);
    final formattedTime = _formatTime(ticket.time);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AppCard(
        padding: const EdgeInsets.all(16),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصف العلوي: رقم التذكرة، التاريخ، والحالة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: colors.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '#${ticket.rowId > 0 ? ticket.rowId : 'OFFLINE'}',
                          style: TextStyle(
                            fontFamily: AppAssets.fontPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colors.primary,
                          ),
                        ),
                      ),
                      if (ticket.syncState != SyncState.synced) ...[
                        const SizedBox(width: 6),
                        AppTooltip(
                          message: context.tr('pending_sync'),
                          child: Icon(
                            Icons.cloud_upload_outlined,
                            size: 16,
                            color: colors.warning,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                AppStatusBadge(status: ticket.status),
              ],
            ),
            const SizedBox(height: 12),

            // اسم المشترك والرقم الأرضي
            Row(
              children: [
                Icon(
                  Icons.person_rounded,
                  size: 18,
                  color: colors.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ticket.subscriberName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: AppAssets.fontPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: colors.onSurface,
                    ),
                  ),
                ),
                if (ticket.landline.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.phone_in_talk_rounded,
                    size: 16,
                    color: colors.primary,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      ticket.landline,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: AppAssets.fontPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: colors.primary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),

            // نوع المشكلة
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: colors.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: colors.outlineVariant.withValues(alpha: 0.25),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.build_circle_outlined,
                    size: 16,
                    color: colors.tertiary,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      ticket.problem,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: AppAssets.fontPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (ticket.description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                ticket.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: AppAssets.fontPrimary,
                  fontSize: 12,
                  color: colors.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ],

            const SizedBox(height: 12),
            Divider(
              height: 1,
              color: colors.outlineVariant.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 10),

            // الصف السفلي: اسم الموظف والتاريخ
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Icon(
                        Icons.badge_outlined,
                        size: 15,
                        color: colors.onSurfaceVariant,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          ticket.employee.isNotEmpty
                              ? ticket.employee
                              : context.tr('unassigned'),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: AppAssets.fontPrimary,
                            fontSize: 12,
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        size: 14,
                        color: colors.onSurfaceVariant.withValues(alpha: 0.7),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          '$formattedDate $formattedTime'.trim(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: AppAssets.fontPrimary,
                            fontSize: 11,
                            color: colors.onSurfaceVariant.withValues(alpha: 0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
