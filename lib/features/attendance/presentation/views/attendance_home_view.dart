import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/contracts/ui_status.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/connectivity/i_connectivity_service.dart';
import '../../../../core/utils/app_snackbars.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/domain/models/user_model.dart';
import '../../domain/enums/attendance_enums.dart';
import '../cubit/attendance_cubit.dart';
import '../cubit/attendance_state.dart';
import 'widgets/widgets.dart';

/// الشاشة الرئيسية لمنظومة الحضور والانصراف (Attendance Home View)
class AttendanceHomeView extends StatelessWidget {
  const AttendanceHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AttendanceCubit>(
      create: (context) => getIt<AttendanceCubit>(),
      child: const _AttendanceHomeContent(),
    );
  }
}

class _AttendanceHomeContent extends StatefulWidget {
  const _AttendanceHomeContent();

  @override
  State<_AttendanceHomeContent> createState() => _AttendanceHomeContentState();
}

class _AttendanceHomeContentState extends State<_AttendanceHomeContent> {
  UserModel? _currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserAndData();
  }

  Future<void> _loadUserAndData() async {
    final session = await AuthRepositoryImpl().getSavedSession();
    if (mounted) {
      setState(() {
        _currentUser = session?.user;
      });
      final userId = _currentUser?.userId ?? 'USR-001';
      context.read<AttendanceCubit>().loadInitialData(userId: userId);
    }
  }

  void _openCorrectionDialog(BuildContext context, AttendanceState state) {
    final userId = _currentUser?.userId ?? 'USR-001';
    final today =
        state.todayStatus?.record?.date ??
        DateTime.now().toString().substring(0, 10);
    final attId = state.todayStatus?.record?.id ?? 'ATT-$today-$userId';

    CorrectionRequestDialog.show(
      context,
      attendanceId: attId,
      initialDate: today,
      initialCheckIn: state.todayStatus?.checkInTime,
      initialCheckOut: state.todayStatus?.checkOutTime,
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
    final userRole = _currentUser?.roleId ?? '';
    final canManageShifts = userRole == 'ROLE_ADMIN' || userRole == 'ROLE_GM';
    final canViewReports =
        userRole == 'ROLE_ADMIN' ||
        userRole == 'ROLE_GM' ||
        userRole == 'ROLE_FINANCE';

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          context.go('/home');
        }
      },
      child: BlocConsumer<AttendanceCubit, AttendanceState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            AppSnackbars.showError(context, state.errorMessage!);
          }
        },
        builder: (context, state) {
          return AppPageScaffold(
            title: 'nav_attendance',
            user: _currentUser,
            currentRoute: '/attendance',
            showBackButton: true,
            onBackPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                context.go('/home');
              }
            },
            actions: [
              // زر إدارة الورديات للإدارة
              if (canManageShifts)
                IconButton(
                  icon: const Icon(Icons.more_time_rounded),
                  tooltip: context.tr('nav_shifts_management'),
                  onPressed: () => context.go('/attendance/shifts'),
                ),
              // زر التقارير المالية والإدارية
              if (canViewReports)
                IconButton(
                  icon: const Icon(Icons.assessment_rounded),
                  tooltip: context.tr('nav_attendance_reports'),
                  onPressed: () => context.go('/attendance/reports'),
                ),
              // زر سجل الحضور التاريخي
              IconButton(
                icon: const Icon(Icons.history_rounded),
                tooltip: context.tr('nav_attendance_history'),
                onPressed: () => context.go('/attendance/history'),
              ),
              // زر التحديث
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                tooltip: context.tr('refresh'),
                onPressed: () {
                  final userId = _currentUser?.userId ?? 'USR-001';
                  context.read<AttendanceCubit>().refresh(userId: userId);
                },
              ),
            ],
            content:
                state.status == UIStatus.loading && state.todayStatus == null
                ? const AttendanceLoadingState()
                : state.status == UIStatus.error && state.todayStatus == null
                ? AttendanceErrorState(
                    errorMessage:
                        state.errorMessage ?? context.tr('error_unknown'),
                    onRetry: () {
                      final userId = _currentUser?.userId ?? 'USR-001';
                      context.read<AttendanceCubit>().loadInitialData(
                        userId: userId,
                      );
                    },
                  )
                : Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(AppDimens.paddingMedium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // شريط مؤشرات الاتصال والمزامنة
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ConnectionStatusIndicator(
                                  status:
                                      state.connectionStatus ??
                                      ConnectionStatus.online,
                                ),
                                SyncStatusBadge(
                                  status: state.pendingCount > 0
                                      ? SyncStatus.pending
                                      : SyncStatus.synced,
                                  pendingCount: state.pendingCount,
                                  onSyncTap: () =>
                                      context.read<AttendanceCubit>().syncNow(),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppDimens.spacingMedium),

                            // بطاقة حالة دوام اليوم
                            AttendanceStatusCard(
                              todayStatus: state.todayStatus,
                            ),
                            const SizedBox(height: AppDimens.spacingMedium),

                            // بطاقة ملخص ساعات اليوم والوردية
                            TodaySummaryCard(
                              todayStatus: state.todayStatus,
                              currentShift: state.shifts.isNotEmpty
                                  ? state.shifts.first
                                  : null,
                            ),
                            const SizedBox(height: AppDimens.spacingLarge),

                            // زر تسجيل الحضور / الانصراف الرئيسي
                            CheckInButton(
                              mode:
                                  (state.todayStatus?.hasCheckedIn ?? false) &&
                                      !(state.todayStatus?.hasCheckedOut ??
                                          false)
                                  ? CheckInButtonMode.checkOut
                                  : CheckInButtonMode.checkIn,
                              isEnabled: true,
                              onPressed: () =>
                                  context.go('/attendance/check-in'),
                            ),
                            const SizedBox(height: AppDimens.spacingMedium),

                            // أزرار الإجراءات السريعة (طلب تصحيح، سجل كامل)
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    label: context.tr(
                                      'action_request_correction',
                                    ),
                                    icon: Icons.edit_calendar_rounded,
                                    variant: AppButtonVariant.tonal,
                                    onPressed: () =>
                                        _openCorrectionDialog(context, state),
                                  ),
                                ),
                                const SizedBox(width: AppDimens.spacingSmall),
                                Expanded(
                                  child: AppButton(
                                    label: context.tr(
                                      'action_view_full_history',
                                    ),
                                    icon: Icons.list_alt_rounded,
                                    variant: AppButtonVariant.outlined,
                                    onPressed: () =>
                                        context.go('/attendance/history'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppDimens.spacingLarge),

                            // ملخص إحصائيات الأسبوع الحالي
                            WeekSummaryWidget(records: state.recentRecords),
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
}
