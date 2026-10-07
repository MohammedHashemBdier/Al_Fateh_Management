import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/contracts/ui_status.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../../../core/design_system/app_radii.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/rbac/role_permissions.dart';
import '../../../../core/utils/app_snackbars.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/domain/models/user_model.dart';
import '../../domain/models/attendance_report_models.dart';
import '../cubit/attendance_reports_cubit.dart';
import '../cubit/attendance_reports_state.dart';
import 'widgets/widgets.dart';

/// شاشة تقارير الدوام والتصدير للمحاسبة والإدارة (Attendance Reports View)
class AttendanceReportsView extends StatelessWidget {
  const AttendanceReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AttendanceReportsCubit>(
      create: (context) => getIt<AttendanceReportsCubit>()..loadReports(),
      child: const _AttendanceReportsContent(),
    );
  }
}

class _AttendanceReportsContent extends StatefulWidget {
  const _AttendanceReportsContent();

  @override
  State<_AttendanceReportsContent> createState() =>
      _AttendanceReportsContentState();
}

class _AttendanceReportsContentState extends State<_AttendanceReportsContent> {
  UserModel? _currentUser;
  bool _isExporting = false;

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

  Future<void> _handleExport(ExportFormat format) async {
    final cubit = context.read<AttendanceReportsCubit>();
    setState(() => _isExporting = true);
    try {
      final msg = await cubit.export(format: format);
      if (mounted) {
        AppSnackbars.showSuccess(context, msg);
      }
    } catch (e) {
      if (mounted) {
        AppSnackbars.showError(context, context.tr('report_export_failed'));
      }
    } finally {
      if (mounted) setState(() => _isExporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCompact = context.isMobile;
    final userRole = UserRole.fromCode(_currentUser?.roleId);

    return RoleGate(
      userRole: userRole,
      allowedRoles: const [
        UserRole.admin,
        UserRole.generalManager,
        UserRole.finance,
      ],
      fallback: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            context.go('/attendance');
          }
        },
        child: AppPageScaffold(
          title: 'attendance_reports_title',
          user: _currentUser,
          showBackButton: true,
          onBackPressed: () => context.go('/attendance'),
          content: const Center(
            child: AppText.titleLarge('unauthorized_access'),
          ),
        ),
      ),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            context.go('/attendance');
          }
        },
        child: BlocConsumer<AttendanceReportsCubit, AttendanceReportsState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              AppSnackbars.showError(context, state.errorMessage!);
            }
          },
          builder: (context, state) {
            final cubit = context.read<AttendanceReportsCubit>();
            final summary = state.summary;

            return AppPageScaffold(
              title: 'attendance_reports_title',
              user: _currentUser,
              currentRoute: '/attendance/reports',
              showBackButton: true,
              onBackPressed: () => context.go('/attendance'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  tooltip: context.tr('refresh'),
                  onPressed: () => cubit.loadReports(),
                ),
              ],
              content: state.status == UIStatus.loading && summary == null
                  ? const AttendanceLoadingState()
                  : Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(
                            AppDimens.paddingMedium,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // شريط اختيار الفترة الزمنية
                              _buildPeriodSelector(context, state, cubit),
                              const SizedBox(height: AppDimens.spacingLarge),

                              // بطاقات المؤشرات الأساسية (KPIs)
                              if (summary != null)
                                _buildSummaryKpis(context, summary, isCompact),
                              const SizedBox(height: AppDimens.spacingLarge),

                              // خيارات التصدير (PDF, Excel, CSV)
                              _buildExportCard(context, state),
                              const SizedBox(height: AppDimens.spacingLarge),

                              // جدول التفاصيل
                              _buildEntriesSection(context, state),
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPeriodSelector(
    BuildContext context,
    AttendanceReportsState state,
    AttendanceReportsCubit cubit,
  ) {
    final colors = context.colors;

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.label(
            'select_report_period',
            fontWeight: FontWeight.bold,
            color: colors.onSurfaceVariant,
          ),
          const SizedBox(height: AppDimens.spacingSmall),
          Wrap(
            spacing: AppDimens.space8,
            children: [
              _buildPeriodChip(
                context,
                title: 'period_daily',
                selected: state.period == ReportPeriod.daily,
                onTap: () => cubit.changePeriod(ReportPeriod.daily),
              ),
              _buildPeriodChip(
                context,
                title: 'period_weekly',
                selected: state.period == ReportPeriod.weekly,
                onTap: () => cubit.changePeriod(ReportPeriod.weekly),
              ),
              _buildPeriodChip(
                context,
                title: 'period_monthly',
                selected: state.period == ReportPeriod.monthly,
                onTap: () => cubit.changePeriod(ReportPeriod.monthly),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodChip(
    BuildContext context, {
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    final colors = context.colors;

    return ChoiceChip(
      label: Text(context.tr(title)),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: colors.primary,
      labelStyle: TextStyle(
        fontFamily: AppAssets.fontPrimary,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        color: selected ? colors.onPrimary : colors.onSurface,
      ),
    );
  }

  Widget _buildSummaryKpis(
    BuildContext context,
    AttendanceReportSummary summary,
    bool isCompact,
  ) {
    final colors = context.colors;

    final kpis = [
      _KpiData(
        title: 'kpi_present_days',
        value: '${summary.presentDays} / ${summary.totalDays}',
        icon: Icons.check_circle_rounded,
        color: colors.success,
      ),
      _KpiData(
        title: 'kpi_total_hours',
        value: '${summary.totalActualHours.toStringAsFixed(1)} س',
        icon: Icons.access_time_filled_rounded,
        color: colors.primary,
      ),
      _KpiData(
        title: 'kpi_overtime_hours',
        value: '+${summary.totalOvertimeHours.toStringAsFixed(1)} س',
        icon: Icons.trending_up_rounded,
        color: colors.info,
      ),
      _KpiData(
        title: 'kpi_late_minutes',
        value: '${summary.totalLateMinutes} د',
        icon: Icons.warning_amber_rounded,
        color: colors.warning,
      ),
    ];

    if (isCompact) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppDimens.spacingSmall,
          mainAxisSpacing: AppDimens.spacingSmall,
          childAspectRatio: 2.0,
        ),
        itemCount: kpis.length,
        itemBuilder: (context, index) => _buildKpiBox(context, kpis[index]),
      );
    }

    return Row(
      children: kpis
          .map(
            (k) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.space4,
                ),
                child: _buildKpiBox(context, k),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildKpiBox(BuildContext context, _KpiData kpi) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      decoration: BoxDecoration(
        color: kpi.color.withValues(alpha: 0.08),
        borderRadius: AppRadii.md,
        border: Border.all(color: kpi.color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.space8),
            decoration: BoxDecoration(
              color: kpi.color.withValues(alpha: 0.15),
              borderRadius: AppRadii.sm,
            ),
            child: Icon(kpi.icon, color: kpi.color, size: AppDimens.iconMd),
          ),
          const SizedBox(width: AppDimens.spacingSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.caption(
                  kpi.title,
                  color: colors.onSurfaceVariant,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppDimens.space2),
                AppText.literal(
                  kpi.value,
                  variant: AppTextVariant.titleMedium,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExportCard(BuildContext context, AttendanceReportsState state) {
    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.download_rounded),
              const SizedBox(width: AppDimens.spacingSmall),
              AppText.title(
                'export_report_title',
                fontWeight: FontWeight.bold,
                fontFamily: AppAssets.fontSecondary,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                label: 'PDF',
                icon: Icons.picture_as_pdf_rounded,
                variant: AppButtonVariant.outlined,
                height: AppDimens.buttonHeightSm,
                isLoading: _isExporting,
                onPressed: () => _handleExport(ExportFormat.pdf),
              ),
              const SizedBox(width: AppDimens.spacingSmall),
              AppButton(
                label: 'Excel',
                icon: Icons.table_view_rounded,
                variant: AppButtonVariant.outlined,
                height: AppDimens.buttonHeightSm,
                isLoading: _isExporting,
                onPressed: () => _handleExport(ExportFormat.excel),
              ),
              const SizedBox(width: AppDimens.spacingSmall),
              AppButton(
                label: 'CSV',
                icon: Icons.text_snippet_rounded,
                variant: AppButtonVariant.outlined,
                height: AppDimens.buttonHeightSm,
                isLoading: _isExporting,
                onPressed: () => _handleExport(ExportFormat.csv),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEntriesSection(
    BuildContext context,
    AttendanceReportsState state,
  ) {
    if (state.entries.isEmpty) {
      return AttendanceEmptyState(message: context.tr('no_report_data'));
    }

    return AppCard(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.title(
            'report_details_table_title',
            fontWeight: FontWeight.bold,
            fontFamily: AppAssets.fontSecondary,
          ),
          const SizedBox(height: AppDimens.spacingMedium),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                  label: AppText.label('col_date', fontWeight: FontWeight.bold),
                ),
                DataColumn(
                  label: AppText.label(
                    'col_employee',
                    fontWeight: FontWeight.bold,
                  ),
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
                  label: AppText.label(
                    'col_status',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              rows: state.entries.map((e) {
                return DataRow(
                  cells: [
                    DataCell(AppText.literal(e.date)),
                    DataCell(AppText.literal(e.userName)),
                    DataCell(AppText.literal(e.checkInTime ?? '--:--')),
                    DataCell(AppText.literal(e.checkOutTime ?? '--:--')),
                    DataCell(
                      AppText.literal('${e.actualHours.toStringAsFixed(1)} س'),
                    ),
                    DataCell(AppStatusBadge(status: e.status)),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _KpiData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _KpiData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}
