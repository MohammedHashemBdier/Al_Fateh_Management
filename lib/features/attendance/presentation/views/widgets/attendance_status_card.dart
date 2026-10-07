import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/enums/attendance_enums.dart';
import '../../../domain/models/today_status.dart';

/// بطاقة عرض حالة دوام اليوم مع تفاصيل الوقت والساعات المسجلة
class AttendanceStatusCard extends StatelessWidget {
  final TodayStatus? todayStatus;
  final VoidCallback? onActionTap;

  const AttendanceStatusCard({
    super.key,
    required this.todayStatus,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final status = todayStatus?.status ?? AttendanceStatus.absent;
    final record = todayStatus?.record;

    final checkIn = todayStatus?.checkInTime ?? record?.checkInTime ?? '--:--';
    final checkOut =
        todayStatus?.checkOutTime ?? record?.checkOutTime ?? '--:--';
    final hours = record?.actualHours.toStringAsFixed(1) ?? '0.0';
    final lateMins = record?.lateMinutes ?? 0;

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingLarge),
      backgroundColor: colors.surfaceContainerLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppDimens.space10),
                    decoration: BoxDecoration(
                      color: _getStatusColor(
                        context,
                        status,
                      ).withValues(alpha: 0.15),
                      borderRadius: AppRadii.md,
                    ),
                    child: Icon(
                      _getStatusIcon(status),
                      color: _getStatusColor(context, status),
                      size: AppDimens.iconLg,
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingMedium),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.label(
                        'att_today_status_label',
                        color: colors.onSurfaceVariant,
                      ),
                      const SizedBox(height: AppDimens.space4),
                      AppText.titleLarge(
                        _getStatusLabel(context, status),
                        fontWeight: FontWeight.bold,
                        fontFamily: AppAssets.fontSecondary,
                        color: colors.onSurface,
                        isTranslated: false,
                      ),
                    ],
                  ),
                ],
              ),
              AppStatusBadge(status: _getStatusLabel(context, status)),
            ],
          ),
          const SizedBox(height: AppDimens.spacingLarge),
          const AppDivider(),
          const SizedBox(height: AppDimens.spacingMedium),
          Row(
            children: [
              Expanded(
                child: _buildMetric(
                  context,
                  title: 'att_check_in_time',
                  value: checkIn,
                  icon: Icons.login_rounded,
                  color: colors.success,
                ),
              ),
              Expanded(
                child: _buildMetric(
                  context,
                  title: 'att_check_out_time',
                  value: checkOut,
                  icon: Icons.logout_rounded,
                  color: colors.primary,
                ),
              ),
              Expanded(
                child: _buildMetric(
                  context,
                  title: 'att_actual_hours',
                  value: '$hours ${context.tr('att_hours_short')}',
                  icon: Icons.timer_outlined,
                  color: colors.info,
                ),
              ),
              if (lateMins > 0)
                Expanded(
                  child: _buildMetric(
                    context,
                    title: 'att_late_minutes',
                    value: '$lateMins ${context.tr('att_mins_short')}',
                    icon: Icons.warning_amber_rounded,
                    color: colors.warning,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: AppDimens.iconSm, color: color),
            const SizedBox(width: AppDimens.space4),
            Expanded(
              child: AppText.caption(
                title,
                color: colors.onSurfaceVariant,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimens.space4),
        AppText.literal(
          value,
          variant: AppTextVariant.bodyLarge,
          fontWeight: FontWeight.bold,
          color: colors.onSurface,
        ),
      ],
    );
  }

  Color _getStatusColor(BuildContext context, AttendanceStatus status) {
    final colors = context.colors;
    switch (status) {
      case AttendanceStatus.present:
        return colors.success;
      case AttendanceStatus.late:
        return colors.warning;
      case AttendanceStatus.absent:
        return colors.error;
      case AttendanceStatus.onLeave:
        return colors.info;
      case AttendanceStatus.halfDay:
        return colors.tertiary;
      case AttendanceStatus.earlyLeave:
        return colors.warning;
      case AttendanceStatus.holiday:
        return colors.secondary;
    }
  }

  IconData _getStatusIcon(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return Icons.check_circle_rounded;
      case AttendanceStatus.late:
        return Icons.access_time_rounded;
      case AttendanceStatus.absent:
        return Icons.cancel_rounded;
      case AttendanceStatus.onLeave:
        return Icons.beach_access_rounded;
      case AttendanceStatus.halfDay:
        return Icons.timelapse_rounded;
      case AttendanceStatus.earlyLeave:
        return Icons.exit_to_app_rounded;
      case AttendanceStatus.holiday:
        return Icons.celebration_rounded;
    }
  }

  String _getStatusLabel(BuildContext context, AttendanceStatus status) {
    return context.isArabic ? status.labelAr : status.labelEn;
  }
}
