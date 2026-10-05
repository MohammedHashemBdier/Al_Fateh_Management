import 'package:flutter/material.dart';

/// واجهة خدمة التنقل الموحدة (Navigation Service Contract)
abstract class INavigationService {
  void goTo(BuildContext context, String routeName, {Object? extra});
  void replaceWith(BuildContext context, String routeName, {Object? extra});
  void goBack(BuildContext context);
  bool canGoBack(BuildContext context);
  String getCurrentLocation(BuildContext context);
}
