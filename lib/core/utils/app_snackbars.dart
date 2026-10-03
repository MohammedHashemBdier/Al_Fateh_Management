import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../localization/backend_message_translator.dart';

class AppSnackbars {
  AppSnackbars._();

  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      icon: Icons.check_circle_rounded,
      backgroundColor: const Color(0xff1b5e20),
      foregroundColor: Colors.white,
    );
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      icon: Icons.error_rounded,
      backgroundColor: const Color(0xffb71c1c),
      foregroundColor: Colors.white,
    );
  }

  static void showWarning(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      icon: Icons.warning_rounded,
      backgroundColor: const Color(0xffe65100),
      foregroundColor: Colors.white,
    );
  }

  static void showInfo(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      icon: Icons.info_rounded,
      backgroundColor: const Color(0xff0d47a1),
      foregroundColor: Colors.white,
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
