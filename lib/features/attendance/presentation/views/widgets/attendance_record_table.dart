import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/design_system/app_dimens.dart';
import '../../../../../core/design_system/app_radii.dart';
import '../../../../../core/utils/context_extensions.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../domain/enums/attendance_enums.dart';
import '../../../domain/models/attendance_record.dart';

/// جدول عرض سجلات الدوام للشاشات الكبيرة والديسكتوب (Attendance Records Data Table)
class AttendanceRecordTable extends StatelessWidget {
  final List<AttendanceRecord> records;
  final void Function(AttendanceRecord)? onRowTap;

  const AttendanceRecordTable({
    super.key,
    required this.records,
    this.onRowTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadii.lg,
        border: Border.all(color: colors.outlineVariant.withValues(alpha: 0.4)),
      ),
      child: ClipRRect(
        borderRadius: AppRadii.lg,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 800),
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(
                colors.surfaceContainerHighest.withValues(alpha: 0.4),
              ),
              dataRowMinHeight: 52,
              dataRowMaxHeight: 56,
              horizontalMargin: AppDimens.paddingMedium,
              columnSpacing: AppDimens.paddingLarge,
              columns: [
                DataColumn(
                  label: AppText.label('col_date', fontWeight: FontWeight.bold),
                ),
                DataColumn(
                  label: AppText.label(
                    'col_check_in',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DataColumn(
                  label: AppText.label(
                    'col_check_out',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DataColumn(
                  label: AppText.label(
                    'col_actual_hours',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DataColumn(
                  label: AppText.label('col_late', fontWeight: FontWeight.bold),
                ),
                DataColumn(
                  label: AppText.label(
                    'col_overtime',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DataColumn(
                  label: AppText.label(
                    'col_status',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DataColumn(
                  label: AppText.label(
                    'col_geofence',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DataColumn(
                  label: AppText.label(
                    'col_actions',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              rows: records.map((record) {
                final statusLabel = context.isArabic
                    ? record.status.labelAr
                    : record.status.labelEn;
                final geofenceLabel = context.isArabic
                    ? record.geofenceStatus.labelAr
                    : record.geofenceStatus.labelEn;

                return DataRow(
                  onSelectChanged: onRowTap != null
                      ? (_) => onRowTap!(record)
                      : null,
                  cells: [
                    // Date
                    DataCell(
                      AppText.literal(record.date, fontWeight: FontWeight.w600),
                    ),
                    // Check-In
                    DataCell(
                      AppText.literal(
                        record.checkInTime ?? '--:--',
                        color: colors.success,
                      ),
                    ),
                    // Check-Out
                    DataCell(
                      AppText.literal(
                        record.checkOutTime ?? '--:--',
                        color: colors.primary,
                      ),
                    ),
                    // Hours
                    DataCell(
                      AppText.literal(
                        '${record.actualHours.toStringAsFixed(1)} ${context.tr('att_hours_short')}',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Late
                    DataCell(
                      record.lateMinutes > 0
                          ? AppText.literal(
                              '${record.lateMinutes} ${context.tr('att_mins_short')}',
                              color: colors.warning,
                              fontWeight: FontWeight.bold,
                            )
                          : const AppText.literal('--'),
                    ),
                    // Overtime
                    DataCell(
                      record.overtimeHours > 0
                          ? AppText.literal(
                              '+${record.overtimeHours.toStringAsFixed(1)}',
                              color: colors.success,
                              fontWeight: FontWeight.bold,
                            )
                          : const AppText.literal('--'),
                    ),
                    // Status
                    DataCell(AppStatusBadge(status: statusLabel)),
                    // Geofence
                    DataCell(
                      _buildGeofenceBadge(
                        context,
                        record.geofenceStatus,
                        geofenceLabel,
                      ),
                    ),
                    // Actions
                    DataCell(
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                        ),
                        tooltip: context.tr('view_details'),
                        onPressed: onRowTap != null
                            ? () => onRowTap!(record)
                            : null,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
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
      child: Text(
        label,
        style: TextStyle(
          fontFamily: AppAssets.fontPrimary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
