import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/design_system/app_breakpoints.dart';
import '../../core/design_system/app_dimens.dart';
import '../../core/services/services.dart';
import '../../core/utils/context_extensions.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/domain/models/user_model.dart';
import 'app_app_bar.dart';
import 'app_empty_state.dart';
import 'app_skeleton.dart';
import 'scaffold/app_scaffold_view_model.dart';
import 'scaffold/components/app_bottom_nav.dart';
import 'scaffold/components/app_drawer.dart';
import 'scaffold/components/app_navigation_sidebar.dart';
import 'scaffold/components/app_swipe_navigation.dart';

/// الهيكل التكيفي الموحد الأساسي لكافة شاشات المنظومة (Base Adaptive AppScaffold)
class AppScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final bool useDefaultAppBar;
  final bool showAppBar;
  final String? title;
  final String? subtitle;
  final String? currentRoute;
  final UserModel? user;
  final bool showDrawer;
  final bool showNavigation;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final List<Widget>? extraActions;
  final Widget? leading;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final bool applyPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? customPadding;
  final bool withGradientBackground;
  final bool resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final bool isScrollable;
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final bool isEmpty;
  final String? emptyMessage;
  final Future<void> Function()? onRefresh;
  final bool enableSwipeNavigation;

  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.useDefaultAppBar = true,
    this.showAppBar = true,
    this.title,
    this.subtitle,
    this.currentRoute,
    this.user,
    this.showDrawer = true,
    this.showNavigation = true,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions,
    this.extraActions,
    this.leading,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.applyPadding = true,
    this.padding,
    this.customPadding,
    this.withGradientBackground = false,
    this.resizeToAvoidBottomInset = true,
    this.backgroundColor,
    this.isScrollable = false,
    this.isLoading = false,
    this.hasError = false,
    this.errorMessage,
    this.onRetry,
    this.isEmpty = false,
    this.emptyMessage,
    this.onRefresh,
    this.enableSwipeNavigation = true,
  });

  /// نقطة البناء التي يمكن للـ Variants المتخصصة تخصيصها
  Widget buildBody(BuildContext context) => body ?? const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isMobile = AppBreakpoints.isMobile(context);
    final isTablet = AppBreakpoints.isTablet(context);
    final isCompact = AppBreakpoints.isCompact(context);
    final activeRoute =
        currentRoute ??
        AppNavigationService.instance.getCurrentLocation(context);

    // توفير الـ Cubit إذا لم يكن متاحاً في الشجرة المحيطة (على التابلت تكون مطوية كـ Rail افتراضياً)
    return BlocProvider(
      create: (_) =>
          AppScaffoldCubit(initialExpanded: !isTablet)
            ..setActiveRoute(activeRoute),
      child: BlocBuilder<AppScaffoldCubit, AppScaffoldState>(
        builder: (context, scaffoldState) {
          final isSidebarExpanded = scaffoldState.isSidebarExpanded;

          // 1. تجهيز الـ AppBar
          PreferredSizeWidget? resolvedAppBar = appBar;
          if (resolvedAppBar == null && useDefaultAppBar && showAppBar) {
            resolvedAppBar = AppAppBar(
              title: title,
              subtitle: subtitle,
              leading: leading,
              showBackButton: showBackButton,
              onBackPressed: onBackPressed,
              actions: actions,
              extraActions: extraActions,
            );
          }

          // 2. تجهيز محتوى الصفحة
          Widget content = buildBody(context);

          // تطبيق حالات Loading / Error / Empty
          if (isLoading) {
            content = Padding(
              padding: const EdgeInsets.all(AppDimens.paddingLarge),
              child: AppSkeleton.form(),
            );
          } else if (hasError) {
            content = Center(
              child: AppEmptyState(
                icon: Icons.error_outline_rounded,
                title: context.tr('error_occurred'),
                subtitle: errorMessage ?? context.tr('something_went_wrong'),
                actionLabel: onRetry != null ? context.tr('retry') : null,
                onAction: onRetry,
              ),
            );
          } else if (isEmpty) {
            content = Center(
              child: AppEmptyState(
                icon: Icons.inbox_rounded,
                title: emptyMessage ?? context.tr('no_data'),
              ),
            );
          }

          // تطبيق التمرير التلقائي
          if (isScrollable) {
            content = SingleChildScrollView(
              padding:
                  padding ??
                  customPadding ??
                  EdgeInsets.symmetric(
                    horizontal: isCompact
                        ? AppDimens.paddingMedium
                        : AppDimens.paddingLarge,
                    vertical: AppDimens.paddingMedium,
                  ),
              child: content,
            );
          } else if (applyPadding) {
            content = Padding(
              padding:
                  padding ??
                  customPadding ??
                  EdgeInsets.symmetric(
                    horizontal: isCompact
                        ? AppDimens.paddingMedium
                        : AppDimens.paddingLarge,
                    vertical: AppDimens.paddingMedium,
                  ),
              child: content,
            );
          }

          // سحب للتحديث
          if (onRefresh != null) {
            content = RefreshIndicator(onRefresh: onRefresh!, child: content);
          }

          // تدرج الخلفية في شاشات المصادقة أو الترحيب
          if (withGradientBackground) {
            content = Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colors.surfaceContainerLowest,
                          colors.surfaceContainerLow,
                          colors.surface,
                        ],
                      ),
                    ),
                  ),
                ),
                SafeArea(child: content),
              ],
            );
          }

          final effectiveUser = user ?? AuthLocalDataSourceImpl.currentUser;

          // 3. تجهيز القوائم الجانبية والسفلية
          final resolvedDrawer =
              drawer ??
              ((showDrawer && isMobile && !showNavigation)
                  ? AppDrawer(user: effectiveUser, activeRoute: activeRoute)
                  : null);

          final resolvedBottomNav =
              bottomNavigationBar ??
              ((showNavigation && isMobile)
                  ? AppBottomNav(user: effectiveUser, activeRoute: activeRoute)
                  : null);

          // شاشات التابلت والديسكتوب عند تفعيل النافيغيشن (عرض >= 650)
          if (showNavigation && !isMobile) {
            return Scaffold(
              backgroundColor: backgroundColor ?? colors.surface,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              floatingActionButton: floatingActionButton,
              bottomSheet: bottomSheet,
              body: Row(
                children: [
                  AppNavigationSidebar(
                    user: effectiveUser,
                    isExpanded: isSidebarExpanded,
                    activeRoute: activeRoute,
                    onToggle: () =>
                        context.read<AppScaffoldCubit>().toggleSidebar(),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ?resolvedAppBar,
                        Expanded(
                          child: withGradientBackground
                              ? content
                              : SafeArea(
                                  top: resolvedAppBar == null,
                                  child: content,
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          // شاشات الموبايل والتابلت
          Widget effectiveBody = content;
          if (enableSwipeNavigation && isMobile && showNavigation) {
            effectiveBody = AppSwipeNavigation(
              activeRoute: activeRoute,
              user: effectiveUser,
              enabled: true,
              child: SizedBox.expand(child: content),
            );
          }

          return Scaffold(
            backgroundColor: backgroundColor ?? colors.surface,
            appBar: resolvedAppBar,
            drawer: resolvedDrawer,
            bottomNavigationBar: resolvedBottomNav,
            floatingActionButton: floatingActionButton,
            bottomSheet: bottomSheet,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            body: withGradientBackground
                ? effectiveBody
                : SafeArea(
                    top: resolvedAppBar == null,
                    bottom: resolvedBottomNav == null,
                    child: effectiveBody,
                  ),
          );
        },
      ),
    );
  }
}
