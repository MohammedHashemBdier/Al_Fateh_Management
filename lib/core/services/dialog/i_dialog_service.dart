import 'package:flutter/material.dart';

import '../../widgets/app_confirm_dialog.dart';

/// واجهة خدمة النوافذ المنبثقة الموحدة (IDialogService)
abstract interface class IDialogService {
  /// عرض نافذة تأكيد عملية موحدة
  Future<bool> showConfirm({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    ConfirmDialogVariant variant,
  });

  /// عرض نافذة حوار مخصصة موحدة
  Future<T?> showCustom<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible = true,
  });
}
