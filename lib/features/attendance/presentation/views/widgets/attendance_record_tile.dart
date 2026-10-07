import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/enums/attendance_enums.dart';
import '../../../domain/models/attendance_record.dart';

/// بطاقة سجل دوام فردي في القائمة (Attendance Record Card Tile)
class AttendanceRecordTile extends StatelessWidget {
  final AttendanceRecord record;
  final VoidCallback? onTap;

  const AttendanceRecordTile({super.key, required this.record, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final checkIn = record.checkInTime ?? '--:--';
    final checkOut = record.checkOutTime ?? '--:--';
    final hours = record.actualHours.toStringAsFixed(1);
    final statusLabel = context.isArabic
        ? record.status.labelAr
        : record.status.labelEn;
    final geofenceLabel = context.isArabic
        ? record.geofenceStatus.labelAr
        : record.geofenceStatus.labelEn;

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      onTap: onTap,
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
                      color: colors.primary.withValues(alpha: 0.1),
                      borderRadius: AppRadii.sm,
                    ),
                    child: Icon(
                      Icons.event_note_rounded,
                      size: AppDimens.iconMd,
                      color: colors.primary,
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingSmall),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.literal(
                        record.date,
                        variant: AppTextVariant.titleMedium,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppAssets.fontSecondary,
                        color: colors.onSurface,
                      ),
                      if (record.shiftId != null)
                        AppText.literal(
                          record.shiftId!,
                          variant: AppTextVariant.caption,
                          color: colors.onSurfaceVariant,
                        ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppStatusBadge(status: statusLabel),
                  const SizedBox(width: AppDimens.space6),
                  _buildGeofenceBadge(
                    context,
                    record.geofenceStatus,
                    geofenceLabel,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppDimens.spacingMedium),
          const AppDivider(),
          const SizedBox(height: AppDimens.spacingSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeColumn(
                context,
                title: 'att_check_in_short',
                time: checkIn,
                icon: Icons.login_rounded,
                color: colors.success,
              ),
              _buildTimeColumn(
                context,
                title: 'att_check_out_short',
                time: checkOut,
                icon: Icons.logout_rounded,
                color: colors.primary,
              ),
              _buildTimeColumn(
                context,
                title: 'att_hours_short',
                time: '$hours ${context.tr('att_hours_short')}',
                icon: Icons.timelapse_rounded,
                color: colors.info,
              ),
              if (record.lateMinutes > 0)
                _buildTimeColumn(
                  context,
                  title: 'att_late_short',
                  time: '${record.lateMinutes} ${context.tr('att_mins_short')}',
                  icon: Icons.warning_amber_rounded,
                  color: colors.warning,
                )
              else if (record.overtimeHours > 0)
                _buildTimeColumn(
                  context,
                  title: 'att_overtime_short',
                  time: '+${record.overtimeHours.toStringAsFixed(1)}',
                  icon: Icons.trending_up_rounded,
                  color: colors.success,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeColumn(
    BuildContext context, {
    required String title,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: AppDimens.iconXs, color: color),
            const SizedBox(width: AppDimens.space4),
            AppText.caption(title, color: colors.onSurfaceVariant),
          ],
        ),
        const SizedBox(height: AppDimens.space2),
        AppText.literal(
          time,
          variant: AppTextVariant.bodyMedium,
          fontWeight: FontWeight.bold,
          color: colors.onSurface,
        ),
      ],
    );
  }

  Widget _buildGeofenceBadge(
    BuildContext context,
    GeofenceStatus status,
    String label,
  ) {
    final colors = context.colors;
    final isInside = status == GeofenceStatus.inside;

    final color = isInside ? colors.success : colors.warning;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: AppRadii.full,
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isInside ? Icons.location_on_rounded : Icons.location_off_rounded,
            size: 11,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontFamily: AppAssets.fontPrimary,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
