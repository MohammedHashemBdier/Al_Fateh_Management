import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../localization/backend_message_translator.dart';
import '../theme/theme.dart';

class AppSnackbars {
  AppSnackbars._();

  static void showSuccess(BuildContext context, String message) {
    final colors = Theme.of(context).colorScheme;
    _showSnackBar(
      context: context,
      message: message,
      icon: Icons.check_circle_rounded,
      backgroundColor: colors.success,
      foregroundColor: colors.onSuccess,
    );
  }

  static void showError(BuildContext context, String message) {
    final colors = Theme.of(context).colorScheme;
    _showSnackBar(
      context: context,
      message: message,
      icon: Icons.error_rounded,
      backgroundColor: colors.error,
      foregroundColor: colors.onError,
    );
  }

  static void showWarning(BuildContext context, String message) {
    final colors = Theme.of(context).colorScheme;
    _showSnackBar(
      context: context,
      message: message,
      icon: Icons.warning_rounded,
      backgroundColor: colors.warning,
      foregroundColor: colors.onWarning,
    );
  }

  static void showInfo(BuildContext context, String message) {
    final colors = Theme.of(context).colorScheme;
    _showSnackBar(
      context: context,
      message: message,
      icon: Icons.info_rounded,
      backgroundColor: colors.info,
      foregroundColor: colors.onInfo,
    );
  }

  static void _showSnackBar({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color backgroundColor,
    required Color foregroundColor,
  }) {
    final displayMessage =
        BackendMessageTranslator.translate(context, message);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 6,
          behavior: SnackBarBehavior.floating,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          content: Row(
            children: [
              Icon(icon, color: foregroundColor, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  displayMessage,
                  style: TextStyle(
                    fontFamily: AppAssets.fontPrimary,
                    color: foregroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 3),
        ),
      );
  }
}
