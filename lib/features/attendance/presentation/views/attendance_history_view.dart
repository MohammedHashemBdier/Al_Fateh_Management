import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/contracts/ui_status.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/domain/models/user_model.dart';
import '../../domain/models/attendance_filter.dart';
import '../../domain/models/attendance_record.dart';
import '../cubit/attendance_history_cubit.dart';
import '../cubit/attendance_history_state.dart';
import 'widgets/widgets.dart';

/// شاشة سجلات الحضور والانصراف السابقة (Attendance History View)
class AttendanceHistoryView extends StatelessWidget {
  const AttendanceHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AttendanceHistoryCubit>(
      create: (context) => getIt<AttendanceHistoryCubit>(),
      child: const _AttendanceHistoryContent(),
    );
  }
}

class _AttendanceHistoryContent extends StatefulWidget {
  const _AttendanceHistoryContent();

  @override
  State<_AttendanceHistoryContent> createState() =>
      _AttendanceHistoryContentState();
}

class _AttendanceHistoryContentState extends State<_AttendanceHistoryContent> {
  UserModel? _currentUser;
  bool _isTableView = false;

  @override
  void initState() {
    super.initState();
    _loadUserAndRecords();
  }

  Future<void> _loadUserAndRecords() async {
    final session = await AuthRepositoryImpl().getSavedSession();
    if (mounted) {
      setState(() {
        _currentUser = session?.user;
        _isTableView = !context.isMobile;
      });
      final userId = _currentUser?.userId ?? 'USR-001';
      context.read<AttendanceHistoryCubit>().loadRecords(userId: userId);
    }
  }

  void _openFilter(BuildContext context, AttendanceHistoryState state) {
    final cubit = context.read<AttendanceHistoryCubit>();
    AttendanceFilterSheet.show(
      context,
      initialFilter: state.filter ?? const AttendanceFilter(),
      onApply: (filter) => cubit.applyFilter(filter),
    );
  }

  void _navigateToDetails(AttendanceRecord record) {
    context.go('/attendance/details/${record.id}', extra: record);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isCompact = context.isMobile;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          context.go('/attendance');
        }
      },
      child: BlocBuilder<AttendanceHistoryCubit, AttendanceHistoryState>(
        builder: (context, state) {
          final cubit = context.read<AttendanceHistoryCubit>();
          final records = state.filteredRecords;

          return AppListScaffold(
            title: 'nav_attendance_history',
            user: _currentUser,
            currentRoute: '/attendance/history',
            showBackButton: true,
            onBackPressed: () => context.go('/attendance'),
            filterHeader: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingMedium,
                vertical: AppDimens.paddingSmall,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.titleLarge(
                          'history_view_title',
                          fontFamily: AppAssets.fontSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: AppDimens.space2),
                        AppText.caption(
                          '${context.tr('records_count')}: ${records.length}',
                          color: colors.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                  // زر الفلترة
                  AppButton(
                    label: context.tr('filter'),
                    icon: Icons.filter_list_rounded,
                    variant: AppButtonVariant.outlined,
                    height: AppDimens.buttonHeightSm,
                    onPressed: () => _openFilter(context, state),
                  ),
                  const SizedBox(width: AppDimens.spacingSmall),
                  // زر التبديل بين الجدول والبطاقات
                  if (!isCompact)
                    IconButton(
                      icon: Icon(
                        _isTableView
                            ? Icons.grid_view_rounded
                            : Icons.table_chart_rounded,
                        color: colors.primary,
                      ),
                      tooltip: context.tr(
                        _isTableView ? 'switch_to_cards' : 'switch_to_table',
                      ),
                      onPressed: () =>
                          setState(() => _isTableView = !_isTableView),
                    ),
                  // زر التحديث
                  IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    tooltip: context.tr('refresh'),
                    onPressed: () {
                      final userId = _currentUser?.userId ?? 'USR-001';
                      cubit.loadRecords(userId: userId);
                    },
                  ),
                ],
              ),
            ),
            listBody: state.status == UIStatus.loading
                ? const AttendanceLoadingState()
                : state.status == UIStatus.error
                ? AttendanceErrorState(
                    errorMessage:
                        state.errorMessage ?? context.tr('error_unknown'),
                    onRetry: () {
                      final userId = _currentUser?.userId ?? 'USR-001';
                      cubit.loadRecords(userId: userId);
                    },
                  )
                : records.isEmpty
                ? AttendanceEmptyState(
                    message: context.tr('no_attendance_records'),
                    actionLabel: context.tr('clear_filters'),
                    onAction: () => cubit.clearFilter(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(AppDimens.paddingMedium),
                    child: _isTableView && !isCompact
                        ? AttendanceRecordTable(
                            records: records,
                            onRowTap: _navigateToDetails,
                          )
                        : ListView.separated(
                            itemCount: records.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: AppDimens.spacingSmall),
                            itemBuilder: (context, index) {
                              final record = records[index];
                              return AttendanceRecordTile(
                                record: record,
                                onTap: () => _navigateToDetails(record),
                              );
                            },
                          ),
                  ),
          );
        },
      ),
    );
  }
}
