import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';
import 'app_button.dart';
import 'app_card.dart';

enum ConfirmDialogVariant {
  info,
  warning,
  danger,
  success;

  Color getColor(BuildContext context) {
    switch (this) {
      case ConfirmDialogVariant.info:
        return context.colors.primary;
      case ConfirmDialogVariant.warning:
        return const Color(0xfff59e0b);
      case ConfirmDialogVariant.danger:
        return context.colors.error;
      case ConfirmDialogVariant.success:
        return const Color(0xff10b981);
    }
  }

  IconData get icon {
    switch (this) {
      case ConfirmDialogVariant.info:
        return Icons.info_outline_rounded;
      case ConfirmDialogVariant.warning:
        return Icons.warning_amber_rounded;
      case ConfirmDialogVariant.danger:
        return Icons.error_outline_rounded;
      case ConfirmDialogVariant.success:
        return Icons.check_circle_outline_rounded;
    }
  }
}

/// نافذة تأكيد موحدة وجمالية للعمليات الحساسة (AppConfirmDialog)
class AppConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmText;
  final String? cancelText;
  final ConfirmDialogVariant variant;
  final VoidCallback? onConfirm;

  const AppConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText,
    this.cancelText,
    this.variant = ConfirmDialogVariant.warning,
    this.onConfirm,
  });

  /// عرض النافذة واسترجاع قرار المستخدم `Future<bool>`
  static Future<bool> show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    ConfirmDialogVariant variant = ConfirmDialogVariant.warning,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AppConfirmDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        variant: variant,
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final variantColor = variant.getColor(context);

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.escape): () {
          Navigator.of(context).pop(false);
        },
      },
      child: Focus(
        autofocus: true,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: AppCard(
                padding: const EdgeInsets.all(24),
                borderRadius: 20,
                borderColor: variantColor.withValues(alpha: 0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // أيقونة النمط المحاطة بدائرة
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: variantColor.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        variant.icon,
                        size: 32,
                        color: variantColor,
                      ),
                    ),
                    const SizedBox(height: 18),

                    // العنوان
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontFamily: AppAssets.fontSecondary,
                        fontWeight: FontWeight.bold,
                        color: colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // الرسالة التوضيحية
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontFamily: AppAssets.fontPrimary,
                        color: colors.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // أزرار التأكيد والإلغاء بتصميم متجاوب
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            label: cancelText ?? context.tr('cancel'),
                            variant: AppButtonVariant.outlined,
                            height: 44,
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AppButton(
                            label: confirmText ?? context.tr('confirm'),
                            variant: variant == ConfirmDialogVariant.danger
                                ? AppButtonVariant.danger
                                : AppButtonVariant.primary,
                            height: 44,
                            onPressed: () {
                              onConfirm?.call();
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
