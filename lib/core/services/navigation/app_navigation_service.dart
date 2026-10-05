import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'i_navigation_service.dart';

/// تطبيق خدمة التنقل المعتمد على GoRouter في منظومة الفتح
class AppNavigationService implements INavigationService {
  const AppNavigationService();

  static const INavigationService instance = AppNavigationService();

  @override
  void goTo(BuildContext context, String routeName, {Object? extra}) {
    context.go(routeName, extra: extra);
  }

  @override
  void replaceWith(BuildContext context, String routeName, {Object? extra}) {
    context.pushReplacement(routeName, extra: extra);
  }

  @override
  void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/home');
    }
  }

  @override
  bool canGoBack(BuildContext context) => context.canPop();

  @override
  String getCurrentLocation(BuildContext context) {
    try {
      return GoRouterState.of(context).uri.path;
    } catch (_) {
      return '/home';
    }
  }
}
