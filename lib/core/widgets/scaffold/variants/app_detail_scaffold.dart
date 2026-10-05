import 'package:flutter/material.dart';
import '../../app_scaffold.dart';

/// هيكل صفحات التفاصيل مع زر الرجوع مفعل افتراضياً (Detail Scaffold Variant)
class AppDetailScaffold extends AppScaffold {
  final Widget detailContent;

  const AppDetailScaffold({
    super.key,
    required super.title,
    super.subtitle,
    required this.detailContent,
    super.currentRoute,
    super.user,
    super.actions,
    super.extraActions,
    super.leading,
    super.showBackButton = true,
    super.onBackPressed,
    super.showAppBar = true,
    super.showDrawer = false,
    super.showNavigation = true,
    super.floatingActionButton,
    super.bottomNavigationBar,
    super.isScrollable = false,
    super.applyPadding = true,
    super.padding,
    super.isLoading = false,
    super.hasError = false,
    super.errorMessage,
    super.onRetry,
    super.isEmpty = false,
    super.emptyMessage,
    super.onRefresh,
    super.backgroundColor,
  });

  @override
  Widget buildBody(BuildContext context) => detailContent;
}
