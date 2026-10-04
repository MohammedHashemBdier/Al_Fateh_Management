import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';
import 'app_hover.dart';
import 'app_tooltip.dart';

enum AppButtonVariant { primary, tonal, outlined, danger, text, ghost }

/// زر قياسي متقدم يدعم Hover، التحميل، الأنماط، والتلميحات التوضيحية
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final AppButtonVariant variant;
  final double? width;
  final double height;
  final String? tooltip;
  final Color? customColor;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.variant = AppButtonVariant.primary,
    this.width,
    this.height = 48.0,
    this.tooltip,
    this.customColor,
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
                    : (customColor ?? colors.primary),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ] else if (icon != null) ...[
          Icon(icon, size: 20),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontFamily: AppAssets.fontPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ],
    );

    Widget button;
    switch (variant) {
      case AppButtonVariant.primary:
        button = FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: customColor ?? colors.primary,
            foregroundColor: colors.onPrimary,
            elevation: 2,
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
            backgroundColor: customColor?.withValues(alpha: 0.15) ?? colors.primaryContainer,
            foregroundColor: customColor ?? colors.onPrimaryContainer,
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
            foregroundColor: customColor ?? colors.primary,
            side: BorderSide(
              color: (customColor ?? colors.primary).withValues(alpha: 0.5),
              width: 1.4,
            ),
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
            backgroundColor: customColor ?? colors.error,
            foregroundColor: colors.onError,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: childWidget,
        );
        break;
      case AppButtonVariant.text:
        button = TextButton(
          style: TextButton.styleFrom(
            foregroundColor: customColor ?? colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: childWidget,
        );
        break;
      case AppButtonVariant.ghost:
        button = TextButton(
          style: TextButton.styleFrom(
            foregroundColor: customColor ?? colors.onSurfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: childWidget,
        );
        break;
    }

    Widget sizedButton = SizedBox(
      width: width,
      height: height,
      child: button,
    );

    // إضافة تأثير Hover للتفاعل المكتبي
    Widget hoverable = AppHover.scale(
      scale: isLoading ? 1.0 : 1.015,
      child: sizedButton,
    );

    if (tooltip != null && tooltip!.isNotEmpty) {
      return AppTooltip(message: tooltip!, child: hoverable);
    }

    return hoverable;
  }
}

/// زر أيقونة موحد يدعم تلميحات وتأثيرات التفاعل
class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? color;
  final double size;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.color,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    Widget btn = IconButton(
      icon: Icon(icon, size: size, color: color ?? colors.onSurfaceVariant),
      onPressed: onPressed,
      visualDensity: VisualDensity.compact,
    );
    if (tooltip != null && tooltip!.isNotEmpty) {
      return AppTooltip(message: tooltip!, child: btn);
    }
    return btn;
  }
}

