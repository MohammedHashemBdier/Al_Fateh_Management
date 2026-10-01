import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';
import 'app_button.dart';

class AppEmptyState extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  const AppEmptyState({
    super.key,
    this.title,
    this.subtitle,
    this.icon = Icons.inbox_outlined,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final resolvedTitle = title ?? context.tr('no_data');

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colors.primaryContainer.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 48,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              resolvedTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppAssets.fontSecondary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: colors.onSurface,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 6),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppAssets.fontPrimary,
                  fontSize: 13,
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 20),
              AppButton(
                label: actionLabel!,
                onPressed: onAction,
                variant: AppButtonVariant.tonal,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
