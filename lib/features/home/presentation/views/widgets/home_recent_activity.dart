import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:al_fateh_management/core/constants/app_assets.dart';
import 'package:al_fateh_management/core/utils/context_extensions.dart';
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
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => context.go('/tickets'),
              child: Row(
                children: [
                  Text(
                    context.tr('stat_view_all'),
                    style: TextStyle(
                      fontFamily: AppAssets.fontPrimary,
                      color: colors.primary,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios_rounded, size: 12, color: colors.primary),
                ],
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
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (ctx, index) {
              final ticket = tickets[index];
              return AppHover(
                builder: (c, isHovered) {
                  return AppCard(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    borderRadius: 12,
                    borderColor: isHovered ? colors.primary.withValues(alpha: 0.4) : null,
                    onTap: () => context.go('/tickets'),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: colors.primaryContainer,
                          child: Icon(
                            Icons.support_agent_rounded,
                            size: 18,
                            color: colors.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                ticket.subscriberName.isNotEmpty
                                    ? ticket.subscriberName
                                    : ticket.landline,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: AppAssets.fontSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: colors.onSurface,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${ticket.problem} • ${ticket.employee}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: AppAssets.fontPrimary,
                                  fontSize: 11,
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 85),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: AppStatusBadge(status: ticket.status),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
      ],
    );
  }
}
