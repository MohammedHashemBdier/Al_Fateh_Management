import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';

enum AppButtonVariant { primary, tonal, outlined, danger }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final AppButtonVariant variant;
  final double? width;
  final double height;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.variant = AppButtonVariant.primary,
    this.width,
    this.height = 46.0,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final childWidget = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              valueColor: AlwaysStoppedAnimation<Color>(
                variant == AppButtonVariant.primary
                    ? colors.onPrimary
                    : colors.primary,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ] else if (icon != null) ...[
          Icon(icon, size: 20),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: const TextStyle(
            fontFamily: AppAssets.fontPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );

    Widget button;
    switch (variant) {
      case AppButtonVariant.primary:
        button = FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: childWidget,
        );
        break;
      case AppButtonVariant.tonal:
        button = FilledButton.tonal(
          style: FilledButton.styleFrom(
            backgroundColor: colors.primaryContainer,
            foregroundColor: colors.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: childWidget,
        );
        break;
      case AppButtonVariant.outlined:
        button = OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: colors.primary,
            side: BorderSide(color: colors.primary.withValues(alpha: 0.5)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: childWidget,
        );
        break;
      case AppButtonVariant.danger:
        button = FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: colors.error,
            foregroundColor: colors.onError,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: childWidget,
        );
        break;
    }

    if (width != null) {
      return SizedBox(width: width, height: height, child: button);
    }

    return SizedBox(height: height, child: button);
  }
}
