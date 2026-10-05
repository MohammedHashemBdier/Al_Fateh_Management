import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../utils/context_extensions.dart';
import 'app_hover.dart';

/// ويدجت رابط تفاعلي مع Hover وتأثير خط سفلي
class AppLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle? style;
  final IconData? icon;

  const AppLink({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppHover(
      onTap: onTap,
      builder: (context, isHovered) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 16,
                color: isHovered ? colors.primary : colors.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
            ],
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style:
                    (style ??
                            TextStyle(
                              fontFamily: AppAssets.fontPrimary,
                              fontSize: 13,
                              color: colors.primary,
                              fontWeight: FontWeight.w600,
                            ))
                        .copyWith(
                          color: isHovered
                              ? colors.primary
                              : colors.primary.withValues(alpha: 0.85),
                          decoration: isHovered
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationColor: colors.primary,
                        ),
              ),
            ),
          ],
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
