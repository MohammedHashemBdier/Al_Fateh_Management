import 'package:flutter/material.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../app_scaffold.dart';

/// هيكل صفحات الجداول والقوائم مع ترويسة الفلاتر وشريط الصفحات (List/Table Scaffold Variant)
class AppListScaffold extends AppScaffold {
  final Widget? filterHeader;
  final Widget listBody;
  final Widget? paginationFooter;

  const AppListScaffold({
    super.key,
    required super.title,
    super.subtitle,
    required this.listBody,
    this.filterHeader,
    this.paginationFooter,
    super.currentRoute,
    super.user,
    super.actions,
    super.extraActions,
    super.leading,
    super.showBackButton = false,
    super.onBackPressed,
    super.showAppBar = true,
    super.showDrawer = true,
    super.showNavigation = true,
    super.floatingActionButton,
    super.bottomNavigationBar,
    super.isLoading = false,
    super.hasError = false,
    super.errorMessage,
    super.onRetry,
    super.isEmpty = false,
    super.emptyMessage,
    super.onRefresh,
    super.backgroundColor,
  }) : super(applyPadding: false);

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        if (filterHeader != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingMedium,
              vertical: AppDimens.paddingSmall,
            ),
            child: filterHeader!,
          ),
          const Divider(height: 1),
        ],
        Expanded(child: listBody),
        if (paginationFooter != null) ...[
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingMedium,
              vertical: AppDimens.space6,
            ),
            child: paginationFooter!,
          ),
        ],
      ],
    );
  }
}
