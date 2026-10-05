import 'package:flutter/material.dart';

import '../../../../core/design_system/app_dimens.dart';
import '../../app_scaffold.dart';

/// هيكل صفحات النماذج والإدخال مع تحجيم العرض الأقصى والتمرير التلقائي (Form Scaffold Variant)
class AppFormScaffold extends AppScaffold {
  final Widget formContent;
  final Widget? bottomActionBar;
  final double maxFormWidth;

  const AppFormScaffold({
    super.key,
    required super.title,
    super.subtitle,
    required this.formContent,
    this.bottomActionBar,
    this.maxFormWidth = 680.0,
    super.currentRoute,
    super.user,
    super.actions,
    super.extraActions,
    super.leading,
    super.showBackButton = true,
    super.onBackPressed,
    super.showAppBar = true,
    super.showDrawer = true,
    super.showNavigation = true,
    super.isLoading = false,
    super.hasError = false,
    super.errorMessage,
    super.onRetry,
    super.backgroundColor,
  }) : super(isScrollable: true);

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxFormWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            formContent,
            if (bottomActionBar != null) ...[
              const SizedBox(height: AppDimens.spacingLarge),
              bottomActionBar!,
            ],
          ],
        ),
      ),
    );
  }
}
