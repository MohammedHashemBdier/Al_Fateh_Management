import 'package:flutter/material.dart';
import '../../utils/app_snackbars.dart';
import 'i_snackbar_service.dart';

/// التنفيذ الفعلي لخدمة الإشعارات والتنبيهات الموحدة (AppSnackbarService)
class AppSnackbarService implements ISnackbarService {
  const AppSnackbarService();

  static const ISnackbarService instance = AppSnackbarService();

  @override
  void showSuccess(BuildContext context, String message) {
    AppSnackbars.showSuccess(context, message);
  }

  @override
  void showError(BuildContext context, String message) {
    AppSnackbars.showError(context, message);
  }

  @override
  void showWarning(BuildContext context, String message) {
    AppSnackbars.showWarning(context, message);
  }

  @override
  void showInfo(BuildContext context, String message) {
    AppSnackbars.showInfo(context, message);
  }
}
