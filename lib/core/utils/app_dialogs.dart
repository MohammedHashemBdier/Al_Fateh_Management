import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import 'context_extensions.dart';

class AppDialogs {
  AppDialogs._();

  /// Show responsive confirmation dialog
  static Future<bool> showConfirmDialog({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    Color? confirmColor,
    IconData? icon,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final resolvedConfirm = confirmText ?? ctx.tr('confirm');
        final resolvedCancel = cancelText ?? ctx.tr('cancel');
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: confirmColor ?? ctx.colors.primary, size: 24),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  title,
                  style: ctx.textTheme.titleMedium?.copyWith(
                    fontFamily: AppAssets.fontSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            message,
            style: ctx.textTheme.bodyMedium?.copyWith(
              fontFamily: AppAssets.fontPrimary,
              color: ctx.colors.onSurfaceVariant,
            ),
          ),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(
                resolvedCancel,
                style: const TextStyle(
                  fontFamily: AppAssets.fontPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: confirmColor ?? ctx.colors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(
                resolvedConfirm,
                style: const TextStyle(
                  fontFamily: AppAssets.fontPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
