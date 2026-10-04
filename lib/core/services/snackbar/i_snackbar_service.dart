import 'package:flutter/material.dart';

/// واجهة خدمة الإشعارات والتنبيهات الموحدة (ISnackbarService)
abstract interface class ISnackbarService {
  void showSuccess(BuildContext context, String message);
  void showError(BuildContext context, String message);
  void showWarning(BuildContext context, String message);
  void showInfo(BuildContext context, String message);
}
