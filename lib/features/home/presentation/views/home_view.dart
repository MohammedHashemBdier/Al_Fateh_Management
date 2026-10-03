import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/rbac/role_permissions.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/app_animations.dart';
import '../../../../core/widgets/app_app_bar.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_confirm_dialog.dart';
import '../../../../core/widgets/app_skeleton.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../auth/domain/models/user_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'widgets/home_mobile_nav_bar.dart';
import 'widgets/home_navigation_rail.dart';
import 'widgets/home_quick_actions.dart';
import 'widgets/home_recent_activity.dart';
import 'widgets/home_stats_grid.dart';

/// الواجهة الرئيسية الشاملة والمتكيفة مع جميع المنصات (Adaptive Home View)
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const _HomeViewBody(),
    );
  }
}

class _HomeViewBody extends StatelessWidget {
  const _HomeViewBody();

  void _handleDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.read<HomeCubit>().selectTab(0);
        break;
      case 1:
        context.go('/tickets');
        break;
      case 2:
        context.go('/attendance');
        break;
      case 3:
        context.go('/employees');
        break;
      case 4:
        context.go('/settings');
        break;
    }
  }

  Future<void> _handleLogout(BuildContext context) async {
    await context.read<HomeCubit>().logout();
    if (context.mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError && state.errorMessage == 'auth_session_expired') {
          context.go('/login');
        }
      },
      builder: (context, state) {
        return AppAnimatedSwitch(
          child: _buildStateView(context, state, colors),
        );
      },
    );
  }

  Widget _buildStateView(BuildContext context, HomeState state, ColorScheme colors) {
    if (state is HomeLoading || state is HomeInitial) {
      final cachedUser = state is HomeLoading ? state.cachedUser : null;
      return KeyedSubtree(
        key: const ValueKey('home_skeleton'),
        child: _buildSkeletonDashboard(context, colors, cachedUser),
      );
    }

    if (state is HomeError) {
      return Scaffold(
        key: const ValueKey('home_error'),
        backgroundColor: colors.surface,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: AppCard(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline_rounded, size: 48, color: colors.error),
                    const SizedBox(height: 16),
                    Text(
                      context.tr('error_unknown'),
                      style: context.textTheme.titleMedium?.copyWith(
                        fontFamily: AppAssets.fontSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.errorMessage,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontFamily: AppAssets.fontPrimary,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            label: context.tr('refresh'),
                            icon: Icons.refresh_rounded,
                            onPressed: () => context.read<HomeCubit>().loadHomeData(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AppButton(
                            label: context.tr('logout'),
                            variant: AppButtonVariant.outlined,
                            onPressed: () => _handleLogout(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    final loaded = state as HomeLoaded;
    final user = loaded.user;
    final role = UserRole.fromCode(user.roleId);

    return KeyedSubtree(
      key: const ValueKey('home_loaded'),
      child: ResponsiveBuilder(
          desktop: (ctx) => Scaffold(
            backgroundColor: colors.surface,
            body: Row(
              children: [
                HomeNavigationRail(
                  user: user,
                  selectedIndex: loaded.selectedNavIndex,
                  onDestinationSelected: (idx) => _handleDestinationSelected(ctx, idx),
                  isExpanded: true,
                  onLogout: () => _handleLogout(ctx),
                ),
                Expanded(
                  child: _buildMainDashboardContent(
                    context: ctx,
                    user: user,
                    role: role,
                    state: loaded,
                  ),
                ),
              ],
            ),
          ),
          tablet: (ctx) => Scaffold(
            backgroundColor: colors.surface,
            body: Row(
              children: [
                HomeNavigationRail(
                  user: user,
                  selectedIndex: loaded.selectedNavIndex,
                  onDestinationSelected: (idx) => _handleDestinationSelected(ctx, idx),
                  isExpanded: false,
                  onLogout: () => _handleLogout(ctx),
                ),
                Expanded(
                  child: _buildMainDashboardContent(
                    context: ctx,
                    user: user,
                    role: role,
                    state: loaded,
                  ),
                ),
              ],
            ),
          ),
          mobile: (ctx) => Scaffold(
            backgroundColor: colors.surface,
            appBar: AppAppBar(
              extraActions: [
                IconButton(
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.refresh_rounded, size: 18),
                  tooltip: ctx.tr('refresh'),
                  onPressed: () => ctx.read<HomeCubit>().refreshData(),
                ),
                IconButton(
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.logout_rounded, size: 18),
                  tooltip: ctx.tr('logout'),
                  onPressed: () async {
                    final confirm = await AppConfirmDialog.show(
                      context: ctx,
                      title: ctx.tr('confirm_logout_title'),
                      message: ctx.tr('confirm_logout_msg'),
                      confirmText: ctx.tr('confirm_logout_button'),
                      variant: ConfirmDialogVariant.danger,
                    );
                    if (confirm && ctx.mounted) {
                      _handleLogout(ctx);
                    }
                  },
                ),
              ],
            ),
            body: _buildMainDashboardContent(
              context: ctx,
              user: user,
              role: role,
              state: loaded,
            ),
            bottomNavigationBar: HomeMobileNavBar(
              user: user,
              selectedIndex: loaded.selectedNavIndex,
              onDestinationSelected: (idx) => _handleDestinationSelected(ctx, idx),
            ),
          ),
        ),
      );
    }

  Widget _buildMainDashboardContent({
    required BuildContext context,
    required dynamic user,
    required UserRole role,
    required HomeLoaded state,
  }) {
    final colors = context.colors;
    final isCompact = context.isMobile;

    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().refreshData(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: isCompact ? 16.0 : 28.0,
          vertical: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // تنبيه وضع عدم الاتصال (Offline Mode Banner)
            if (state.isOffline) ...[
              AppFadeSlide(
                delay: const Duration(milliseconds: 30),
                child: AppCard(
                  backgroundColor: colors.warningContainer,
                  borderColor: colors.warning.withValues(alpha: 0.5),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Icon(Icons.cloud_off_rounded, color: colors.onWarningContainer, size: 22),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          context.tr('stat_offline_indicator'),
                          style: TextStyle(
                            fontFamily: AppAssets.fontPrimary,
                            color: colors.onWarningContainer,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.sync_rounded, color: colors.onWarningContainer, size: 20),
                        tooltip: context.tr('stat_refresh_data'),
                        onPressed: () => context.read<HomeCubit>().refreshData(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
            ],

            // ترويسة الترحيب المخصصة للدور (Welcome Banner)
            AppFadeSlide(
              delay: const Duration(milliseconds: 50),
              child: AppCard(
                padding: EdgeInsets.all(isCompact ? 14.0 : 18.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${context.tr('welcome_admin')}: ${user.fullName.isNotEmpty ? user.fullName : user.username}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: (isCompact
                                    ? context.textTheme.titleMedium
                                    : context.textTheme.headlineSmall)
                                ?.copyWith(
                              fontFamily: AppAssets.fontSecondary,
                              fontWeight: FontWeight.bold,
                              color: colors.primary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: colors.primaryContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  context.isArabic ? role.titleAr : role.titleEn,
                                  style: TextStyle(
                                    fontFamily: AppAssets.fontPrimary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: colors.onPrimaryContainer,
                                  ),
                                ),
                              ),
                              Text(
                                '•  ${user.department}',
                                style: context.textTheme.bodySmall?.copyWith(
                                  fontFamily: AppAssets.fontPrimary,
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (!isCompact) ...[
                      const SizedBox(width: 14),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: colors.primaryContainer,
                        child: Icon(
                          Icons.dashboard_customize_rounded,
                          color: colors.onPrimaryContainer,
                          size: 22,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 1. شبكة بطاقات الإحصائيات (Stats Grid)
            HomeStatsGrid(
              stats: state.stats,
              user: user,
            ),
            const SizedBox(height: 28),

            // 2. قسم الإجراءات السريعة المخصص بالدور (Role-Gated Quick Actions)
            HomeQuickActions(user: user),
            const SizedBox(height: 28),

            // 3. أحدث المتابعات المسجلة (Recent Activity)
            HomeRecentActivity(tickets: state.stats.recentTickets),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonDashboard(BuildContext context, ColorScheme colors, UserModel? user) {
    final effectiveUser = user ??
        const UserModel(
          userId: 'USR-000',
          username: 'admin',
          fullName: '...',
          department: 'MANAGEMENT',
          roleId: 'ROLE_ADMIN',
          status: 'ACTIVE',
        );

    final isCompact = context.isMobile;

    return ResponsiveBuilder(
      desktop: (ctx) => Scaffold(
        backgroundColor: colors.surface,
        body: Row(
          children: [
            HomeNavigationRail(
              user: effectiveUser,
              selectedIndex: 0,
              onDestinationSelected: (_) {},
              isExpanded: true,
              onLogout: () {},
            ),
            Expanded(
              child: _buildSkeletonDashboardContent(context, isCompact, effectiveUser),
            ),
          ],
        ),
      ),
      tablet: (ctx) => Scaffold(
        backgroundColor: colors.surface,
        body: Row(
          children: [
            HomeNavigationRail(
              user: effectiveUser,
              selectedIndex: 0,
              onDestinationSelected: (_) {},
              isExpanded: false,
              onLogout: () {},
            ),
            Expanded(
              child: _buildSkeletonDashboardContent(context, isCompact, effectiveUser),
            ),
          ],
        ),
      ),
      mobile: (ctx) => Scaffold(
        backgroundColor: colors.surface,
        appBar: const AppAppBar(showStatus: false),
        body: _buildSkeletonDashboardContent(context, isCompact, effectiveUser),
        bottomNavigationBar: HomeMobileNavBar(
          selectedIndex: 0,
          onDestinationSelected: (_) {},
          user: effectiveUser,
        ),
      ),
    );
  }

  Widget _buildSkeletonDashboardContent(BuildContext context, bool isCompact, UserModel user) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 16.0 : 28.0,
        vertical: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Welcome Card Skeleton
          const AppSkeleton(height: 72, borderRadius: 16),
          const SizedBox(height: 24),

          // 2. Stats Grid Skeleton
          HomeStatsGrid(isLoading: true, user: user),
          const SizedBox(height: 28),

          // 3. Quick Actions Skeleton
          const AppSkeleton(height: 48, borderRadius: 14),
          const SizedBox(height: 28),

          // 4. Recent Tickets Skeleton
          const AppSkeleton(height: 180, borderRadius: 16),
        ],
      ),
    );
  }
}
