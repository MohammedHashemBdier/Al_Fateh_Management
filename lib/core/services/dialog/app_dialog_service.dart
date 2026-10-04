import 'package:flutter/material.dart';
import '../../widgets/app_confirm_dialog.dart';
import 'i_dialog_service.dart';

/// التنفيذ الفعلي لخدمة النوافذ المنبثقة الموحدة (AppDialogService)
class AppDialogService implements IDialogService {
  const AppDialogService();

  static const IDialogService instance = AppDialogService();

  @override
  Future<bool> showConfirm({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    ConfirmDialogVariant variant = ConfirmDialogVariant.warning,
  }) {
    return AppConfirmDialog.show(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      variant: variant,
    );
  }

  @override
  Future<T?> showCustom<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  static Future<bool> confirm({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    ConfirmDialogVariant variant = ConfirmDialogVariant.warning,
  }) {
    return instance.showConfirm(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      variant: variant,
    );
  }

  static Future<bool> info({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
  }) {
    return confirm(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: '',
      variant: ConfirmDialogVariant.info,
    );
  }

  static Future<bool> warning({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
  }) {
    return confirm(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      variant: ConfirmDialogVariant.warning,
    );
  }

  static Future<bool> danger({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
  }) {
    return confirm(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: cancelText,
      variant: ConfirmDialogVariant.danger,
    );
  }

  static Future<bool> error({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
  }) {
    return confirm(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: '',
      variant: ConfirmDialogVariant.danger,
    );
  }

  static Future<bool> success({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
  }) {
    return confirm(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText,
      cancelText: '',
      variant: ConfirmDialogVariant.success,
    );
  }

  static Future<T?> custom<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return instance.showCustom<T>(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
    );
  }
}
