import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/contracts/ui_status.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/rbac/role_permissions.dart';
import '../../../../core/services/dialog/app_dialog_service.dart';
import '../../../../core/utils/app_snackbars.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../auth/data/repositories/auth_repository_impl.dart';
import '../../../auth/domain/models/user_model.dart';
import '../../domain/models/shift.dart';
import '../cubit/shift_management_cubit.dart';
import '../cubit/shift_management_state.dart';
import 'widgets/widgets.dart';

/// شاشة إدارة الورديات وفترات الدوام (Shift Management View)
class ShiftManagementView extends StatelessWidget {
  const ShiftManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShiftManagementCubit>(
      create: (context) => getIt<ShiftManagementCubit>()..loadShifts(),
      child: const _ShiftManagementContent(),
    );
  }
}

class _ShiftManagementContent extends StatefulWidget {
  const _ShiftManagementContent();

  @override
  State<_ShiftManagementContent> createState() =>
      _ShiftManagementContentState();
}

class _ShiftManagementContentState extends State<_ShiftManagementContent> {
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

  void _openShiftDialog(BuildContext context, {Shift? existingShift}) {
    final cubit = context.read<ShiftManagementCubit>();
    final nameCtrl = TextEditingController(
      text: existingShift?.shiftName ?? '',
    );
    final startCtrl = TextEditingController(
      text: existingShift?.startTime ?? '08:00',
    );
    final endCtrl = TextEditingController(
      text: existingShift?.endTime ?? '16:00',
    );
    final graceCtrl = TextEditingController(
      text: (existingShift?.gracePeriodMins ?? 15).toString(),
    );
    final hoursCtrl = TextEditingController(
      text: (existingShift?.standardHours ?? 8.0).toString(),
    );

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: AppText.titleLarge(
          existingShift != null ? 'edit_shift_title' : 'add_shift_title',
          fontWeight: FontWeight.bold,
          fontFamily: AppAssets.fontSecondary,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                label: context.tr('shift_name_label'),
                controller: nameCtrl,
              ),
              const SizedBox(height: AppDimens.spacingMedium),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: context.tr('start_time_label'),
                      controller: startCtrl,
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingSmall),
                  Expanded(
                    child: AppTextField(
                      label: context.tr('end_time_label'),
                      controller: endCtrl,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimens.spacingMedium),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: context.tr('grace_period_label'),
                      controller: graceCtrl,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: AppDimens.spacingSmall),
                  Expanded(
                    child: AppTextField(
                      label: context.tr('standard_hours_label'),
                      controller: hoursCtrl,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          AppButton(
            label: context.tr('cancel'),
            variant: AppButtonVariant.outlined,
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          AppButton(
            label: context.tr('save'),
            variant: AppButtonVariant.primary,
            onPressed: () {
              final newShift = Shift(
                shiftId:
                    existingShift?.shiftId ??
                    'SHIFT-${DateTime.now().millisecondsSinceEpoch}',
                shiftName: nameCtrl.text.trim(),
                startTime: startCtrl.text.trim(),
                endTime: endCtrl.text.trim(),
                gracePeriodMins: int.tryParse(graceCtrl.text.trim()) ?? 15,
                standardHours: double.tryParse(hoursCtrl.text.trim()) ?? 8.0,
                isActive: true,
              );

              if (existingShift != null) {
                cubit.updateShift(newShift);
              } else {
                cubit.addShift(newShift);
              }
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, Shift shift) async {
    final confirmed = await AppDialogService.confirm(
      context: context,
      title: context.tr('delete_shift_title'),
      message: '${context.tr('delete_shift_confirm')}: ${shift.shiftName}؟',
      confirmText: context.tr('delete'),
      cancelText: context.tr('cancel'),
      variant: ConfirmDialogVariant.danger,
    );

    if (confirmed && context.mounted) {
      context.read<ShiftManagementCubit>().deleteShift(shiftId: shift.shiftId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userRole = UserRole.fromCode(_currentUser?.roleId);

    return RoleGate(
      userRole: userRole,
      allowedRoles: const [UserRole.admin, UserRole.generalManager],
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
        child: AppListScaffold(
          title: 'shifts_management_title',
          user: _currentUser,
          showBackButton: true,
          onBackPressed: () => context.go('/attendance'),
          listBody: const Center(
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
        child: BlocConsumer<ShiftManagementCubit, ShiftManagementState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              AppSnackbars.showError(context, state.errorMessage!);
            }
          },
          builder: (context, state) {
            final cubit = context.read<ShiftManagementCubit>();

            return AppListScaffold(
              title: 'shifts_management_title',
              user: _currentUser,
              currentRoute: '/attendance/shifts',
              showBackButton: true,
              onBackPressed: () => context.go('/attendance'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh_rounded),
                  tooltip: context.tr('refresh'),
                  onPressed: () => cubit.loadShifts(),
                ),
              ],
              filterHeader: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.titleLarge(
                    'shifts_management_title',
                    fontFamily: AppAssets.fontSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  AppButton(
                    label: context.tr('add_new_shift_btn'),
                    icon: Icons.add_rounded,
                    variant: AppButtonVariant.primary,
                    height: AppDimens.buttonHeightSm,
                    onPressed: () => _openShiftDialog(context),
                  ),
                ],
              ),
              listBody: state.status == UIStatus.loading
                  ? const AttendanceLoadingState()
                  : state.shifts.isEmpty
                  ? AttendanceEmptyState(
                      message: context.tr('no_shifts_found'),
                      actionLabel: context.tr('add_new_shift_btn'),
                      onAction: () => _openShiftDialog(context),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(AppDimens.paddingMedium),
                      itemCount: state.shifts.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: AppDimens.spacingSmall),
                      itemBuilder: (context, index) {
                        final shift = state.shifts[index];
                        return ShiftCard(
                          shift: shift,
                          onEdit: () =>
                              _openShiftDialog(context, existingShift: shift),
                          onDelete: () => _confirmDelete(context, shift),
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
