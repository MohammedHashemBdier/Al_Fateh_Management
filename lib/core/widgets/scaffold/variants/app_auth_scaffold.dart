import 'package:flutter/material.dart';
import '../../../../core/design_system/app_dimens.dart';
import '../../app_scaffold.dart';

/// هيكل شاشات المصادقة والدخول مع خلفية التدرج والتوسيط (Authentication Scaffold Variant)
class AppAuthScaffold extends AppScaffold {
  final Widget authCard;

  const AppAuthScaffold({
    super.key,
    required this.authCard,
  }) : super(
          showAppBar: false,
          showDrawer: false,
          showNavigation: false,
          useDefaultAppBar: false,
          withGradientBackground: true,
          resizeToAvoidBottomInset: true,
          applyPadding: false,
        );

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingMedium,
          vertical: AppDimens.paddingLarge,
        ),
        child: authCard,
      ),
    );
  }
}
