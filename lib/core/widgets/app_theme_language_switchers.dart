import 'package:flutter/material.dart';

import '../utils/context_extensions.dart';
import 'locale_toggle_button.dart';
import 'theme_toggle_button.dart';

/// ويدجت مجردة وموحدة لمبدلات الثيم واللغة (Theme & Language Switchers)
/// توفر وصولاً سريعاً وموحداً للتحكم بالثيم واللغة عبر مختلف شاشات التطبيق:
/// - شاشة البداية (Splash Screen)
/// - شريط العنوان العلوي (AppAppBar)
/// - أي واجهات إعدادات أو لوحات تحكم مستقبلية
class AppThemeLanguageSwitchers extends StatelessWidget {
  final bool compact;
  final bool spread;
  final double spacing;
  final double themeIconSize;
  final bool withContainer;
  final EdgeInsetsGeometry? padding;

  const AppThemeLanguageSwitchers({
    super.key,
    this.compact = false,
    this.spread = false,
    this.spacing = 8.0,
    this.themeIconSize = 20.0,
    this.withContainer = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final content = LayoutBuilder(
      builder: (context, constraints) {
        // إذا كان العرض المتاح ضيقاً، نستخدم النمط المدمج تلقائياً لمنع أي Overflow
        final isVeryNarrow = constraints.maxWidth < 220;
        final effectiveCompact = compact || isVeryNarrow;

        if (spread) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: LocaleToggleButton(compact: effectiveCompact)),
              const SizedBox(width: 8),
              ThemeToggleButton(size: themeIconSize),
            ],
          );
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: LocaleToggleButton(compact: effectiveCompact)),
            SizedBox(width: spacing),
            ThemeToggleButton(size: themeIconSize),
          ],
        );
      },
    );

    if (withContainer) {
      return Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colors.outline.withValues(alpha: 0.15)),
        ),
        child: content,
      );
    }

    return content;
  }
}
