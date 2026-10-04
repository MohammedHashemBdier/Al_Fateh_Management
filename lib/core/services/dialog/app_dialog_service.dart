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
}
