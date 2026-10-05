import 'package:flutter/material.dart';
import '../../app_scaffold.dart';

/// هيكل صفحة عادية بمحتوى عام (Page Scaffold Variant)
class AppPageScaffold extends AppScaffold {
  final Widget content;

  const AppPageScaffold({
    super.key,
    required super.title,
    super.subtitle,
    required this.content,
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
  Widget buildBody(BuildContext context) => content;
}
