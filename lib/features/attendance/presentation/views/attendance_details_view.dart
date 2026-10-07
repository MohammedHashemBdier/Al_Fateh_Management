import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/contracts/ui_status.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../../../core/design_system/app_radii.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/utils/app_snackbars.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/domain/models/user_model.dart';
import '../../domain/models/attendance_record.dart';
import '../cubit/attendance_details_cubit.dart';
import '../cubit/attendance_details_state.dart';
import 'widgets/widgets.dart';

/// شاشة تفاصيل سجل الحضور وسجل التدقيق المرتبط به (Attendance Details View)
class AttendanceDetailsView extends StatelessWidget {
  final String recordId;
  final AttendanceRecord? initialRecord;

  const AttendanceDetailsView({
    super.key,
    required this.recordId,
    this.initialRecord,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AttendanceDetailsCubit>(
      create: (context) =>
          getIt<AttendanceDetailsCubit>()..loadDetails(recordId: recordId),
      child: _AttendanceDetailsContent(
        recordId: recordId,
        initialRecord: initialRecord,
      ),
    );
  }
}

class _AttendanceDetailsContent extends StatefulWidget {
  final String recordId;
  final AttendanceRecord? initialRecord;

  const _AttendanceDetailsContent({required this.recordId, this.initialRecord});

  @override
  State<_AttendanceDetailsContent> createState() =>
      _AttendanceDetailsContentState();
}

class _AttendanceDetailsContentState extends State<_AttendanceDetailsContent> {
  UserModel? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final session = await AuthRepositoryImpl().getSavedSession();
    if (mounted) {
      setState(() {
        _currentUser = session?.user;
      });
    }
  }

  void _openCorrectionDialog(BuildContext context, AttendanceRecord record) {
    CorrectionRequestDialog.show(
      context,
      attendanceId: record.id,
      initialDate: record.date,
      initialCheckIn: record.checkInTime,
      initialCheckOut: record.checkOutTime,
      onSubmit:
          ({
            required String attendanceId,
            required String targetDate,
            required String? checkIn,
            required String? checkOut,
            required String reason,
          }) {
            AppSnackbars.showSuccess(
              context,
              context.tr('correction_submitted_success'),
            );
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          context.go('/attendance/history');
        }
      },
      child: BlocBuilder<AttendanceDetailsCubit, AttendanceDetailsState>(
        builder: (context, state) {
          final record = state.record ?? widget.initialRecord;

          return AppDetailScaffold(
            title: 'attendance_details_title',
            user: _currentUser,
            currentRoute: '/attendance/details',
            showBackButton: true,
            onBackPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                context.go('/attendance/history');
              }
            },
            detailContent: (state.status == UIStatus.loading && record == null)
                ? const AttendanceLoadingState()
                : (state.status == UIStatus.error && record == null)
                ? AttendanceErrorState(
                    errorMessage:
                        state.errorMessage ?? context.tr('error_unknown'),
                    onRetry: () => context
                        .read<AttendanceDetailsCubit>()
                        .loadDetails(recordId: widget.recordId),
                  )
                : record == null
                ? AttendanceEmptyState(message: context.tr('record_not_found'))
                : Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(AppDimens.paddingMedium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // بطاقة الترويسة الرئيسية
                            _buildHeaderCard(context, record),
                            const SizedBox(height: AppDimens.spacingMedium),

                            // بطاقة المقاييس والوقت
                            _buildMetricsCard(context, record),
                            const SizedBox(height: AppDimens.spacingMedium),

                            // تفاصيل الـ GPS والنطاق
                            _buildGpsCard(context, record),
                            const SizedBox(height: AppDimens.spacingLarge),

                            // زر طلب تصحيح دوام
                            AppButton(
                              label: context.tr('action_request_correction'),
                              icon: Icons.edit_calendar_rounded,
                              variant: AppButtonVariant.primary,
                              onPressed: () =>
                                  _openCorrectionDialog(context, record),
                            ),
                            const SizedBox(height: AppDimens.spacingLarge),

                            // المخطط الزمني للأحداث وسجل التدقيق
                            AttendanceTimeline(
                              record: record,
                              auditLogs: state.auditLog,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, AttendanceRecord record) {
    final colors = context.colors;
    final statusLabel = context.isArabic
        ? record.status.labelAr
        : record.status.labelEn;

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDimens.space12),
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.1),
                  borderRadius: AppRadii.md,
                ),
                child: Icon(
                  Icons.event_available_rounded,
                  size: AppDimens.iconLg,
                  color: colors.primary,
                ),
              ),
              const SizedBox(width: AppDimens.spacingMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.literal(
                    record.date,
                    variant: AppTextVariant.headline,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppAssets.fontSecondary,
                  ),
                  const SizedBox(height: AppDimens.space2),
                  AppText.literal(
                    '${context.tr('record_id_label')}: ${record.id}',
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
              const SizedBox(width: AppDimens.space8),
              SyncStatusBadge(status: record.syncStatus),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsCard(BuildContext context, AttendanceRecord record) {
    final colors = context.colors;

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.title(
            'att_metrics_title',
            fontWeight: FontWeight.bold,
            fontFamily: AppAssets.fontSecondary,
          ),
          const SizedBox(height: AppDimens.spacingMedium),
          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  context,
                  title: 'att_check_in_time',
                  value: record.checkInTime ?? '--:--',
                  icon: Icons.login_rounded,
                  color: colors.success,
                ),
              ),
              Expanded(
                child: _buildMetricItem(
                  context,
                  title: 'att_check_out_time',
                  value: record.checkOutTime ?? '--:--',
                  icon: Icons.logout_rounded,
                  color: colors.primary,
                ),
              ),
              Expanded(
                child: _buildMetricItem(
                  context,
                  title: 'att_actual_hours',
                  value:
                      '${record.actualHours.toStringAsFixed(1)} ${context.tr('att_hours_short')}',
                  icon: Icons.timer_outlined,
                  color: colors.info,
                ),
              ),
            ],
          ),
          if (record.lateMinutes > 0 || record.overtimeHours > 0) ...[
            const SizedBox(height: AppDimens.spacingMedium),
            const AppDivider(),
            const SizedBox(height: AppDimens.spacingSmall),
            Row(
              children: [
                if (record.lateMinutes > 0)
                  Expanded(
                    child: _buildMetricItem(
                      context,
                      title: 'att_late_minutes',
                      value:
                          '${record.lateMinutes} ${context.tr('att_mins_short')}',
                      icon: Icons.warning_amber_rounded,
                      color: colors.warning,
                    ),
                  ),
                if (record.overtimeHours > 0)
                  Expanded(
                    child: _buildMetricItem(
                      context,
                      title: 'att_overtime_hours',
                      value:
                          '+${record.overtimeHours.toStringAsFixed(1)} ${context.tr('att_hours_short')}',
                      icon: Icons.trending_up_rounded,
                      color: colors.success,
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildGpsCard(BuildContext context, AttendanceRecord record) {
    final geofenceLabel = context.isArabic
        ? record.geofenceStatus.labelAr
        : record.geofenceStatus.labelEn;

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.title(
                'att_location_details',
                fontWeight: FontWeight.bold,
                fontFamily: AppAssets.fontSecondary,
              ),
              AppStatusBadge(status: geofenceLabel),
            ],
          ),
          const SizedBox(height: AppDimens.spacingMedium),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.caption('check_in_location'),
                    const SizedBox(height: AppDimens.space4),
                    AppText.literal(
                      record.checkInLat != null
                          ? '${record.checkInLat!.toStringAsFixed(5)}, ${record.checkInLng!.toStringAsFixed(5)}'
                          : '--',
                      variant: AppTextVariant.bodyMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.caption('gps_accuracy_label'),
                    const SizedBox(height: AppDimens.space4),
                    AppText.literal(
                      record.accuracy != null
                          ? '${record.accuracy!.toStringAsFixed(1)} ${context.tr('meters_short')}'
                          : '--',
                      variant: AppTextVariant.bodyMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (record.mockLocationDetected) ...[
            const SizedBox(height: AppDimens.spacingMedium),
            const MockLocationWarning(),
          ],
        ],
      ),
    );
  }

  Widget _buildMetricItem(
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
            AppText.caption(title, color: colors.onSurfaceVariant),
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
}
