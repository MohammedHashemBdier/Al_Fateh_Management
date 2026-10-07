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
import '../../domain/enums/attendance_enums.dart';
import '../../domain/models/correction_request.dart';
import '../../domain/params/approve_correction_params.dart';
import '../../domain/params/reject_correction_params.dart';
import '../../domain/params/request_correction_params.dart';
import '../cubit/correction_cubit.dart';
import '../cubit/correction_state.dart';
import 'widgets/widgets.dart';

/// شاشة طلبات تصحيح الدوام وإدارتها (Attendance Correction Requests View)
class AttendanceCorrectionView extends StatelessWidget {
  const AttendanceCorrectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CorrectionCubit>(
      create: (context) => getIt<CorrectionCubit>(),
      child: const _AttendanceCorrectionContent(),
    );
  }
}

class _AttendanceCorrectionContent extends StatefulWidget {
  const _AttendanceCorrectionContent();

  @override
  State<_AttendanceCorrectionContent> createState() =>
      _AttendanceCorrectionContentState();
}

class _AttendanceCorrectionContentState
    extends State<_AttendanceCorrectionContent>
    with SingleTickerProviderStateMixin {
  UserModel? _currentUser;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadUserAndRequests();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadUserAndRequests() async {
    final session = await AuthRepositoryImpl().getSavedSession();
    if (mounted) {
      setState(() {
        _currentUser = session?.user;
      });
      final userId = _currentUser?.userId ?? 'USR-001';
      final cubit = context.read<CorrectionCubit>();
      cubit.loadMyCorrections(userId: userId);
      if (_canApprove()) {
        cubit.loadCorrections();
      }
    }
  }

  bool _canApprove() {
    final role = _currentUser?.roleId;
    return role == 'ROLE_ADMIN' || role == 'ROLE_GM' || role == 'ROLE_FINANCE';
  }

  void _openNewRequestDialog(BuildContext context) {
    final userId = _currentUser?.userId ?? 'USR-001';
    final today = DateTime.now().toString().substring(0, 10);
    final attId = 'ATT-$today-$userId';

    CorrectionRequestDialog.show(
      context,
      attendanceId: attId,
      initialDate: today,
      onSubmit:
          ({
            required String attendanceId,
            required String targetDate,
            required String? checkIn,
            required String? checkOut,
            required String reason,
          }) async {
            final params = RequestCorrectionParams(
              userId: userId,
              attendanceId: attendanceId,
              targetDate: targetDate,
              correctedCheckIn: checkIn,
              correctedCheckOut: checkOut,
              reason: reason,
            );
            final success = await context.read<CorrectionCubit>().submitRequest(
              params,
            );
            if (success && context.mounted) {
              AppSnackbars.showSuccess(
                context,
                context.tr('correction_submitted_success'),
              );
            }
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final canApprove = _canApprove();

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
      child: BlocConsumer<CorrectionCubit, CorrectionState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            AppSnackbars.showError(context, state.errorMessage!);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CorrectionCubit>();
          final userId = _currentUser?.userId ?? 'USR-001';

          return AppListScaffold(
            title: 'nav_attendance_correction',
            user: _currentUser,
            currentRoute: '/attendance/correction',
            showBackButton: true,
            onBackPressed: () => context.go('/attendance'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                tooltip: context.tr('refresh'),
                onPressed: () {
                  cubit.loadMyCorrections(userId: userId);
                  if (canApprove) cubit.loadCorrections();
                },
              ),
            ],
            filterHeader: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.titleLarge(
                      'correction_requests_title',
                      fontFamily: AppAssets.fontSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                    AppButton(
                      label: context.tr('new_correction_btn'),
                      icon: Icons.add_rounded,
                      variant: AppButtonVariant.primary,
                      height: AppDimens.buttonHeightSm,
                      onPressed: () => _openNewRequestDialog(context),
                    ),
                  ],
                ),
                if (canApprove) ...[
                  const SizedBox(height: AppDimens.spacingMedium),
                  TabBar(
                    controller: _tabController,
                    labelColor: colors.primary,
                    unselectedLabelColor: colors.onSurfaceVariant,
                    indicatorColor: colors.primary,
                    tabs: [
                      Tab(text: context.tr('my_correction_requests')),
                      Tab(
                        text:
                            '${context.tr('pending_approval_requests')} (${state.pendingRequests.length})',
                      ),
                    ],
                  ),
                ],
              ],
            ),
            listBody: state.status == UIStatus.loading
                ? const AttendanceLoadingState()
                : canApprove
                ? TabBarView(
                    controller: _tabController,
                    children: [
                      _buildRequestsList(
                        context,
                        requests: state.myRequests,
                        isManager: false,
                      ),
                      _buildRequestsList(
                        context,
                        requests: state.pendingRequests,
                        isManager: true,
                      ),
                    ],
                  )
                : _buildRequestsList(
                    context,
                    requests: state.myRequests,
                    isManager: false,
                  ),
          );
        },
      ),
    );
  }

  Widget _buildRequestsList(
    BuildContext context, {
    required List<CorrectionRequest> requests,
    required bool isManager,
  }) {
    final colors = context.colors;

    if (requests.isEmpty) {
      return AttendanceEmptyState(
        message: context.tr('no_correction_requests'),
        icon: Icons.assignment_turned_in_rounded,
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      itemCount: requests.length,
      separatorBuilder: (_, _) =>
          const SizedBox(height: AppDimens.spacingSmall),
      itemBuilder: (context, index) {
        final req = requests[index];
        final statusLabel = context.isArabic
            ? req.status.labelAr
            : req.status.labelEn;

        Color statusColor = colors.outline;
        switch (req.status) {
          case CorrectionStatus.approved:
            statusColor = colors.success;
            break;
          case CorrectionStatus.pending:
            statusColor = colors.warning;
            break;
          case CorrectionStatus.rejected:
            statusColor = colors.error;
            break;
          case CorrectionStatus.cancelled:
            statusColor = colors.outline;
            break;
        }

        return AppCard(
          padding: const EdgeInsets.all(AppDimens.paddingMedium),
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
                          Icons.edit_note_rounded,
                          size: AppDimens.iconMd,
                          color: colors.primary,
                        ),
                      ),
                      const SizedBox(width: AppDimens.spacingSmall),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.literal(
                            req.targetDate,
                            variant: AppTextVariant.titleMedium,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppAssets.fontSecondary,
                          ),
                          if (isManager)
                            AppText.literal(
                              '${context.tr('user_id_label')}: ${req.userId}',
                              variant: AppTextVariant.caption,
                              color: colors.onSurfaceVariant,
                            ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.space10,
                      vertical: AppDimens.space4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.12),
                      borderRadius: AppRadii.full,
                      border: Border.all(
                        color: statusColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      statusLabel,
                      style: TextStyle(
                        fontFamily: AppAssets.fontPrimary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.spacingMedium),
              Row(
                children: [
                  Expanded(
                    child: _buildTimeInfo(
                      context,
                      title: 'corrected_check_in',
                      time: req.correctedCheckIn ?? '--:--',
                      icon: Icons.login_rounded,
                      color: colors.success,
                    ),
                  ),
                  Expanded(
                    child: _buildTimeInfo(
                      context,
                      title: 'corrected_check_out',
                      time: req.correctedCheckOut ?? '--:--',
                      icon: Icons.logout_rounded,
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
              if (req.reason.isNotEmpty) ...[
                const SizedBox(height: AppDimens.spacingSmall),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppDimens.space8),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerLow,
                    borderRadius: AppRadii.sm,
                  ),
                  child: AppText.literal(
                    '${context.tr('reason')}: ${req.reason}',
                    variant: AppTextVariant.bodySmall,
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
              if (isManager && req.status == CorrectionStatus.pending) ...[
                const SizedBox(height: AppDimens.spacingMedium),
                const AppDivider(),
                const SizedBox(height: AppDimens.spacingSmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButton(
                      label: context.tr('reject'),
                      variant: AppButtonVariant.outlined,
                      customColor: colors.error,
                      height: AppDimens.buttonHeightSm,
                      onPressed: () {
                        final approverId = _currentUser?.userId ?? 'USR-001';
                        context.read<CorrectionCubit>().rejectRequest(
                          RejectCorrectionParams(
                            requestId: req.requestId,
                            approverId: approverId,
                            reason: 'تم الرفض من الإدارة',
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: AppDimens.spacingSmall),
                    AppButton(
                      label: context.tr('approve'),
                      variant: AppButtonVariant.primary,
                      customColor: colors.success,
                      height: AppDimens.buttonHeightSm,
                      onPressed: () {
                        final approverId = _currentUser?.userId ?? 'USR-001';
                        context.read<CorrectionCubit>().approveRequest(
                          ApproveCorrectionParams(
                            requestId: req.requestId,
                            approverId: approverId,
                            notes: 'تم الاعتماد بنجاح',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimeInfo(
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
        ),
      ],
    );
  }
}
