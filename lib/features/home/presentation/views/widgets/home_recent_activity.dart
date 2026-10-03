import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
import 'package:al_fateh_management/core/widgets/app_animations.dart';
import 'package:al_fateh_management/core/widgets/app_card.dart';
import 'package:al_fateh_management/core/widgets/app_empty_state.dart';
import 'package:al_fateh_management/core/widgets/app_hover.dart';
import 'package:al_fateh_management/core/widgets/app_status_badge.dart';
import 'package:al_fateh_management/features/home/domain/models/dashboard_stats_model.dart';

/// قائمة بأحدث التذاكر والمتابعات المسجلة مع تأثيرات Hover وروابط الانتقال
class HomeRecentActivity extends StatelessWidget {
  final List<RecentTicketItem> tickets;

  const HomeRecentActivity({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                context.tr('stat_recent_tickets'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleMedium?.copyWith(
                  fontFamily: AppAssets.fontSecondary,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
            ),
            const SizedBox(width: 6),
            InkWell(
              onTap: () => context.go('/tickets'),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.tr('stat_view_all'),
                      style: TextStyle(
                        fontFamily: AppAssets.fontPrimary,
                        color: colors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios_rounded, size: 11, color: colors.primary),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (tickets.isEmpty)
          AppEmptyState(
            title: context.tr('no_data'),
            subtitle: context.tr('tickets_view_desc'),
            icon: Icons.assignment_outlined,
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tickets.length.clamp(0, 5),
            separatorBuilder: (context, index) => const SizedBox(height: 7),
            itemBuilder: (ctx, index) {
              final ticket = tickets[index];

              // تحديد الأيقونة واللون حسب حالة التذكرة
              final isResolved = ticket.status.trim() == 'تم الحل' ||
                  ticket.status.toLowerCase().contains('resolved');
              final isInProgress = ticket.status.trim() == 'قيد الحل' ||
                  ticket.status.toLowerCase().contains('progress');

              final statusColor = isResolved
                  ? colors.success
                  : isInProgress
                      ? colors.warning
                      : colors.error;

              final statusIcon = isResolved
                  ? Icons.check_circle_outline_rounded
                  : isInProgress
                      ? Icons.access_time_rounded
                      : Icons.error_outline_rounded;

              return AppFadeSlide(
                delay: Duration(milliseconds: 70 + index * 35),
                child: AppHover(
                  builder: (c, isHovered) {
                    return AppCard(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      borderRadius: 12,
                      borderColor: isHovered ? colors.primary.withValues(alpha: 0.35) : null,
                      onTap: () => context.go('/tickets'),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: statusColor.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(statusIcon, size: 16, color: statusColor),
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  ticket.subscriberName.isNotEmpty
                                      ? ticket.subscriberName
                                      : (ticket.landline.isNotEmpty
                                          ? ticket.landline
                                          : context.tr('subscriber')),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppAssets.fontSecondary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.5,
                                    color: colors.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  ticket.subscriberName.isNotEmpty && ticket.landline.isNotEmpty
                                      ? '${ticket.problem} • ${ticket.landline}'
                                      : '${ticket.problem}${ticket.employee.isNotEmpty ? ' • ${ticket.employee}' : ''}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppAssets.fontPrimary,
                                    fontSize: 10.5,
                                    color: colors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 78),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: AppStatusBadge(status: ticket.status),
                                ),
                              ),
                              if (ticket.cleanDate.isNotEmpty) ...[
                                const SizedBox(height: 3),
                                Text(
                                  ticket.cleanTime.isNotEmpty
                                      ? ticket.cleanTime
                                      : ticket.cleanDate,
                                  style: TextStyle(
                                    fontFamily: AppAssets.fontPrimary,
                                    fontSize: 9.5,
                                    color: colors.outline,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
      ],
    );
  }
}
