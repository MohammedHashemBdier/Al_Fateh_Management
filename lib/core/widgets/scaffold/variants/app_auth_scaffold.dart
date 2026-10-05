import 'package:flutter/material.dart';

import '../../../../core/design_system/app_dimens.dart';
import '../../app_scaffold.dart';

/// هيكل شاشات المصادقة والدخول مع خلفية التدرج والتوسيط (Authentication Scaffold Variant)
class AppAuthScaffold extends AppScaffold {
  final Widget? authCard;
  final Widget? customBody;

  const AppAuthScaffold({
    super.key,
    this.authCard,
    Widget? body,
    super.withGradientBackground = false,
  }) : customBody = body,
       super(
         showAppBar: false,
         showDrawer: false,
         showNavigation: false,
         useDefaultAppBar: false,
         resizeToAvoidBottomInset: true,
         applyPadding: false,
       );

  @override
  Widget buildBody(BuildContext context) {
    if (customBody != null) return customBody!;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingMedium,
          vertical: AppDimens.paddingLarge,
        ),
        child: authCard ?? const SizedBox.shrink(),
      ),
    );
  }
}
