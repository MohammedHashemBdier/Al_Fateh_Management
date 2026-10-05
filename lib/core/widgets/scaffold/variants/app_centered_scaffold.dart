import 'package:flutter/material.dart';
import '../../app_scaffold.dart';

/// هيكل صفحات المحتوى المتمركز بدون أشرطة تنقل (Centered Scaffold Variant - Splash / Error / Status)
class AppCenteredScaffold extends AppScaffold {
  final Widget child;

  const AppCenteredScaffold({
    super.key,
    required this.child,
    super.backgroundColor,
    super.withGradientBackground = false,
  }) : super(
          showAppBar: false,
          showDrawer: false,
          showNavigation: false,
          useDefaultAppBar: false,
          applyPadding: false,
        );

  @override
  Widget buildBody(BuildContext context) => Center(child: child);
}
