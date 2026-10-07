import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/models/attendance_record.dart';
import '../../../domain/models/audit_log_entry.dart';

/// ويدجيت المخطط الزمني للأحداث وسجل التدقيق للسجل (Attendance Audit Timeline)
class AttendanceTimeline extends StatelessWidget {
  final AttendanceRecord record;
  final List<AuditLogEntry> auditLogs;

  const AttendanceTimeline({
    super.key,
    required this.record,
    this.auditLogs = const [],
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final events = <_TimelineItem>[
      // حدث الحضور
      if (record.checkInTime != null)
        _TimelineItem(
          time: record.checkInTime!,
          title: context.tr('timeline_check_in_title'),
          subtitle:
              '${context.tr('timeline_coords')}: (${record.checkInLat?.toStringAsFixed(4) ?? '--'}, ${record.checkInLng?.toStringAsFixed(4) ?? '--'}) | ${context.tr('timeline_accuracy')}: ${record.accuracy?.toStringAsFixed(1) ?? '--'} م',
          icon: Icons.login_rounded,
          color: colors.success,
          isMock: record.mockLocationDetected,
        ),
      // حدث الانصراف
      if (record.checkOutTime != null)
        _TimelineItem(
          time: record.checkOutTime!,
          title: context.tr('timeline_check_out_title'),
          subtitle:
              '${context.tr('timeline_coords')}: (${record.checkOutLat?.toStringAsFixed(4) ?? '--'}, ${record.checkOutLng?.toStringAsFixed(4) ?? '--'})',
          icon: Icons.logout_rounded,
          color: colors.primary,
        ),
      // أحداث سجل التدقيق
      ...auditLogs.map(
        (log) => _TimelineItem(
          time: log.timestamp,
          title: '${log.action} (${log.actorRole})',
          subtitle: log.notes ?? log.newValues ?? '',
          icon: Icons.history_edu_rounded,
          color: colors.info,
        ),
      ),
    ];

    if (events.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.paddingLarge),
          child: AppText.caption(
            'timeline_no_events',
            color: colors.onSurfaceVariant,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.title(
          'att_timeline_header',
          fontWeight: FontWeight.bold,
          fontFamily: AppAssets.fontSecondary,
          color: colors.onSurface,
        ),
        const SizedBox(height: AppDimens.spacingMedium),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: events.length,
          separatorBuilder: (context, index) => Container(
            margin: const EdgeInsetsDirectional.only(start: 19),
            width: 2,
            height: 20,
            color: colors.outlineVariant.withValues(alpha: 0.5),
          ),
          itemBuilder: (context, index) {
            final item = events[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: item.color.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                    border: Border.all(color: item.color, width: 2),
                  ),
                  child: Icon(
                    item.icon,
                    size: AppDimens.iconSm,
                    color: item.color,
                  ),
                ),
                const SizedBox(width: AppDimens.spacingMedium),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.paddingMedium),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerLow,
                      borderRadius: AppRadii.md,
                      border: Border.all(
                        color: item.isMock
                            ? colors.error
                            : colors.outlineVariant.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.literal(
                              item.title,
                              variant: AppTextVariant.bodyMedium,
                              fontWeight: FontWeight.bold,
                              color: colors.onSurface,
                            ),
                            AppText.literal(
                              item.time,
                              variant: AppTextVariant.caption,
                              color: colors.onSurfaceVariant,
                            ),
                          ],
                        ),
                        if (item.subtitle.isNotEmpty) ...[
                          const SizedBox(height: AppDimens.space4),
                          AppText.literal(
                            item.subtitle,
                            variant: AppTextVariant.caption,
                            color: colors.onSurfaceVariant,
                          ),
                        ],
                        if (item.isMock) ...[
                          const SizedBox(height: AppDimens.space6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.space8,
                              vertical: AppDimens.space2,
                            ),
                            decoration: BoxDecoration(
                              color: colors.error.withValues(alpha: 0.15),
                              borderRadius: AppRadii.xs,
                            ),
                            child: AppText.literal(
                              context.tr('mock_location_detected_badge'),
                              variant: AppTextVariant.caption,
                              color: colors.error,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _TimelineItem {
  final String time;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isMock;

  const _TimelineItem({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.isMock = false,
  });
}
