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
import '../cubit/check_in_cubit.dart';
import '../cubit/check_in_state.dart';
import 'widgets/widgets.dart';

/// شاشة تسجيل الحضور والانصراف بالـ GPS والتحقق من النطاق الجغرافي (Check In / Out View)
class CheckInView extends StatelessWidget {
  const CheckInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckInCubit>(
      create: (context) => getIt<CheckInCubit>()..loadLocation(),
      child: const _CheckInViewContent(),
    );
  }
}

class _CheckInViewContent extends StatefulWidget {
  const _CheckInViewContent();

  @override
  State<_CheckInViewContent> createState() => _CheckInViewContentState();
}

class _CheckInViewContentState extends State<_CheckInViewContent> {
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

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

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
      child: BlocConsumer<CheckInCubit, CheckInState>(
        listener: (context, state) {
          if (state.status == UIStatus.loaded) {
            AppSnackbars.showSuccess(
              context,
              context.tr('att_check_success_msg'),
            );
            context.go('/attendance');
          } else if (state.errorMessage != null &&
              state.status == UIStatus.error) {
            AppSnackbars.showError(context, state.errorMessage!);
          }
        },
        builder: (context, state) {
          final cubit = context.read<CheckInCubit>();
          final userId = _currentUser?.userId ?? 'USR-001';

          final isInside = state.geofenceResult?.isInside ?? false;
          final distance = state.geofenceResult?.distanceMeters ?? 0.0;
          final siteName =
              state.geofenceResult?.matchedSite?.siteName ??
              context.tr('company_hq_name');

          return AppPageScaffold(
            title: 'check_in_view_title',
            user: _currentUser,
            currentRoute: '/attendance/check-in',
            showBackButton: true,
            onBackPressed: () => context.go('/attendance'),
            actions: [
              IconButton(
                icon: const Icon(Icons.my_location_rounded),
                tooltip: context.tr('refresh_location'),
                onPressed: state.isCheckingLocation
                    ? null
                    : () => cubit.refreshLocation(),
              ),
            ],
            content: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppDimens.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // مؤشر حالة الـ GPS
                      GpsStatusIndicator(
                        isGpsDisabled: state.isGpsDisabled,
                        isPermissionDenied: state.isPermissionDenied,
                        isPermissionDeniedForever:
                            state.isPermissionDeniedForever,
                        accuracyMeters: state.currentPosition?.accuracy,
                        maxAllowedAccuracy:
                            state.settings?.maxAllowedGpsAccuracy ?? 30.0,
                        isChecking: state.isCheckingLocation,
                        onOpenSettings: state.isPermissionDeniedForever
                            ? () => cubit.openAppSettings()
                            : () => cubit.openLocationSettings(),
                        onRefresh: () => cubit.refreshLocation(),
                      ),
                      const SizedBox(height: AppDimens.spacingMedium),

                      // تحذير تزييف الموقع في حال اكتشافه
                      if (state.isMockLocation) ...[
                        const MockLocationWarning(),
                        const SizedBox(height: AppDimens.spacingMedium),
                      ],

                      // خريطة النطاق الجغرافي
                      GeofenceMap(
                        userLatitude: state.currentPosition?.latitude,
                        userLongitude: state.currentPosition?.longitude,
                        accuracyMeters: state.currentPosition?.accuracy,
                        targetSite: state.geofenceResult?.matchedSite,
                        isInsideGeofence: isInside,
                        height: 280,
                      ),
                      const SizedBox(height: AppDimens.spacingMedium),

                      // بطاقة تفاصيل الموقع والنطاق
                      AppCard(
                        padding: const EdgeInsets.all(AppDimens.paddingMedium),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(
                                    AppDimens.space8,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        (isInside
                                                ? colors.success
                                                : colors.warning)
                                            .withValues(alpha: 0.15),
                                    borderRadius: AppRadii.sm,
                                  ),
                                  child: Icon(
                                    isInside
                                        ? Icons.check_circle_rounded
                                        : Icons.location_searching_rounded,
                                    color: isInside
                                        ? colors.success
                                        : colors.warning,
                                    size: AppDimens.iconMd,
                                  ),
                                ),
                                const SizedBox(width: AppDimens.spacingSmall),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.literal(
                                      siteName,
                                      variant: AppTextVariant.titleMedium,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppAssets.fontSecondary,
                                    ),
                                    AppText.literal(
                                      '${context.tr('geofence_dist')}: ${distance.toStringAsFixed(1)} ${context.tr('meters_short')}',
                                      variant: AppTextVariant.caption,
                                      color: colors.onSurfaceVariant,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            AppStatusBadge(
                              status: context.tr(
                                isInside
                                    ? 'geofence_inside'
                                    : 'geofence_outside',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppDimens.spacingLarge),

                      // زرا تسجيل الحضور وتسجيل الانصراف
                      Row(
                        children: [
                          Expanded(
                            child: CheckInButton(
                              mode: CheckInButtonMode.checkIn,
                              isLoading: state.status == UIStatus.loading,
                              isEnabled: state.canSubmit,
                              disabledReason: state.errorMessage,
                              onPressed: () =>
                                  cubit.submitCheckIn(userId: userId),
                            ),
                          ),
                          const SizedBox(width: AppDimens.spacingMedium),
                          Expanded(
                            child: CheckInButton(
                              mode: CheckInButtonMode.checkOut,
                              isLoading: state.status == UIStatus.loading,
                              isEnabled: state.canSubmit,
                              disabledReason: state.errorMessage,
                              onPressed: () =>
                                  cubit.submitCheckOut(userId: userId),
                            ),
                          ),
                        ],
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
}
